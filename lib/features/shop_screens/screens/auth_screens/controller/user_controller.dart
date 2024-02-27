import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shop_immi/data/repositories/auth_repository.dart';
import 'package:shop_immi/data/repositories/user_repository.dart';
import 'package:shop_immi/features/personlization/screens/setting/re_varify_to_delete_account.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/login.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/popup/full_screen_loader.dart';
import 'package:shop_immi/utils/popup/loaders.dart';
import 'package:shop_immi/utils/usermodel/user_model.dart';

import '../../../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true; //to refresh screen
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///////////////Save User Record
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // refresh user record
      await fetchUserRecord();

      // if record already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          //map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profile: userCredential.user!.photoURL ?? '',
          );

          await UserRepository().saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not Saved', message: 'Re-Save later');
    }
  }

  /// delete user warning popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete account',
        middleText:
            'Are you sure you want to delete your account permanently? ',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
          onPressed: Navigator.of(Get.overlayContext!).pop,
          child: const Text('Cancel'),
        ));
  }

  /// delete user
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.LoadeLlotie);
      // reauth
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //revarify email
        if (provider == 'google.com') {
          await auth.singinWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReVarifyToDeleteAccount());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re-Auth user while deletion of account
  Future<void> reAuthWithEmailandPassordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.LoadeLlotie);
      // reauth
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormkey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthWIthEmailandPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Account deleted Successfully', message: 'come again! dear');
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  /// Upload Profile image
  // Re-Auth user while deletion of account
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512
         );
      if (image != null) {
        imageUploading.value=true;
        //upload image
        final imageUrl =await userRepository.uploadImage('Users/Images/profile/', image);

        // update user image record
        Map<String, dynamic> json = {'profile': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profile = imageUrl;
        user.refresh();
        AuthenticationRepository.instance.screenRedirect();

        TLoaders.successSnackBar(
            title: 'Image Updated', message: 'Your image has been uploaded');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh', message: 'something went wrong');
    }finally{
      imageUploading.value=true;
    }
  }
}
