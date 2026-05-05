import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/welcome_screen.dart';
import '../screens/onboarding/otp_screen.dart';
import '../screens/onboarding/basic_info_screen.dart';
import '../screens/worker/home/worker_home_screen.dart';
import '../screens/worker/matching/matching_screen.dart';
import '../screens/worker/matching/shift_confirmed_screen.dart';
import '../screens/worker/verification/id_upload_screen.dart';
import '../screens/worker/verification/selfie_check_screen.dart';
import '../screens/worker/verification/verified_profile_screen.dart';
import '../screens/worker/shifts/browse_shifts_screen.dart';
import '../screens/worker/shifts/shift_detail_screen.dart';
import '../screens/worker/shifts/application_sent_screen.dart';
import '../screens/worker/availability/weekly_availability_screen.dart';
import '../screens/worker/availability/time_range_picker_screen.dart';
import '../screens/worker/earnings/earnings_overview_screen.dart';
import '../screens/worker/earnings/shift_history_screen.dart';
import '../screens/worker/earnings/payout_detail_screen.dart';
import '../screens/worker/settings/worker_settings_screen.dart';
import '../screens/worker/settings/edit_profile_screen.dart';
import '../screens/worker/settings/notification_settings_screen.dart';
import '../screens/worker/settings/location_settings_screen.dart';
import '../screens/worker/settings/language_screen.dart';
import '../screens/worker/settings/help_center_screen.dart';
import '../screens/worker/settings/about_screen.dart';
import '../screens/employer/home/employer_dashboard_screen.dart';
import '../screens/employer/shifts/post_shift_screen.dart';
import '../screens/employer/shifts/worker_matched_screen.dart';
import '../screens/employer/shifts/worker_confirmed_screen.dart';
import '../screens/employer/onboarding/business_onboarding_screen.dart';
import '../screens/employer/onboarding/document_upload_screen.dart';
import '../screens/employer/onboarding/verified_business_screen.dart';
import '../screens/employer/settings/employer_settings_screen.dart';
import '../screens/employer/settings/edit_business_profile_screen.dart';
import '../screens/employer/settings/shift_templates_screen.dart';
import '../screens/employer/settings/worker_preferences_screen.dart';
import '../screens/employer/settings/employer_notifications_screen.dart';
import '../screens/employer/settings/billing_screen.dart';

class AppRoutes {
  // ── Shared ────────────────────────────────────────────
  static const splash = '/';
  static const welcome = '/welcome';
  static const otp = '/otp';
  static const basicInfo = '/basic-info';

  // ── Worker ────────────────────────────────────────────
  static const workerHome = '/worker/home';
  static const matching = '/worker/matching';
  static const shiftConfirmedWorker = '/worker/shift-confirmed';
  static const idUpload = '/worker/id-upload';
  static const selfieCheck = '/worker/selfie-check';
  static const verifiedProfileWorker = '/worker/verified-profile';
  static const browseShifts = '/worker/shifts/browse';
  static const shiftDetail = '/worker/shifts/detail';
  static const applicationSent = '/worker/shifts/application-sent';
  static const weeklyAvailability = '/worker/availability';
  static const timeRangePicker = '/worker/availability/time-range';
  static const earningsOverview = '/worker/earnings';
  static const shiftHistory = '/worker/earnings/history';
  static const payoutDetail = '/worker/earnings/payout';
  static const workerSettings = '/worker/settings';
  static const editProfile = '/worker/settings/edit-profile';
  static const notificationSettings = '/worker/settings/notifications';
  static const locationSettings = '/worker/settings/location';
  static const language = '/worker/settings/language';
  static const helpCenter = '/worker/settings/help';
  static const about = '/worker/settings/about';

  // ── Employer ──────────────────────────────────────────
  static const employerDashboard = '/employer/dashboard';
  static const postShift = '/employer/shifts/post';
  static const workerMatched = '/employer/shifts/matched';
  static const workerConfirmed = '/employer/shifts/confirmed';
  static const businessOnboarding = '/employer/onboarding';
  static const documentUpload = '/employer/onboarding/documents';
  static const verifiedBusiness = '/employer/onboarding/verified';
  static const employerSettings = '/employer/settings';
  static const editBusinessProfile = '/employer/settings/profile';
  static const shiftTemplates = '/employer/settings/templates';
  static const workerPreferences = '/employer/settings/preferences';
  static const employerNotifications = '/employer/settings/notifications';
  static const billing = '/employer/settings/billing';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.welcome, builder: (_, __) => const WelcomeScreen()),
    GoRoute(path: AppRoutes.otp, builder: (_, state) => OtpScreen(phone: state.uri.queryParameters['phone'] ?? '')),
    GoRoute(path: AppRoutes.basicInfo, builder: (_, state) => BasicInfoScreen(role: state.uri.queryParameters['role'] ?? 'worker')),

    // Worker
    GoRoute(path: AppRoutes.workerHome, builder: (_, __) => const WorkerHomeScreen()),
    GoRoute(path: AppRoutes.matching, builder: (_, __) => const MatchingScreen()),
    GoRoute(path: AppRoutes.shiftConfirmedWorker, builder: (_, __) => const ShiftConfirmedScreen()),
    GoRoute(path: AppRoutes.idUpload, builder: (_, __) => const IdUploadScreen()),
    GoRoute(path: AppRoutes.selfieCheck, builder: (_, __) => const SelfieCheckScreen()),
    GoRoute(path: AppRoutes.verifiedProfileWorker, builder: (_, __) => const VerifiedWorkerProfileScreen()),
    GoRoute(path: AppRoutes.browseShifts, builder: (_, __) => const BrowseShiftsScreen()),
    GoRoute(path: AppRoutes.shiftDetail, builder: (_, __) => const ShiftDetailScreen()),
    GoRoute(path: AppRoutes.applicationSent, builder: (_, __) => const ApplicationSentScreen()),
    GoRoute(path: AppRoutes.weeklyAvailability, builder: (_, __) => const WeeklyAvailabilityScreen()),
    GoRoute(path: AppRoutes.timeRangePicker, builder: (_, __) => const TimeRangePickerScreen()),
    GoRoute(path: AppRoutes.earningsOverview, builder: (_, __) => const EarningsOverviewScreen()),
    GoRoute(path: AppRoutes.shiftHistory, builder: (_, __) => const ShiftHistoryScreen()),
    GoRoute(path: AppRoutes.payoutDetail, builder: (_, __) => const PayoutDetailScreen()),
    GoRoute(path: AppRoutes.workerSettings, builder: (_, __) => const WorkerSettingsScreen()),
    GoRoute(path: AppRoutes.editProfile, builder: (_, __) => const EditProfileScreen()),
    GoRoute(path: AppRoutes.notificationSettings, builder: (_, __) => const NotificationSettingsScreen()),
    GoRoute(path: AppRoutes.locationSettings, builder: (_, __) => const LocationSettingsScreen()),
    GoRoute(path: AppRoutes.language, builder: (_, __) => const LanguageScreen()),
    GoRoute(path: AppRoutes.helpCenter, builder: (_, __) => const HelpCenterScreen()),
    GoRoute(path: AppRoutes.about, builder: (_, __) => const AboutScreen()),

    // Employer
    GoRoute(path: AppRoutes.employerDashboard, builder: (_, __) => const EmployerDashboardScreen()),
    GoRoute(path: AppRoutes.postShift, builder: (_, __) => const PostShiftScreen()),
    GoRoute(path: AppRoutes.workerMatched, builder: (_, __) => const WorkerMatchedScreen()),
    GoRoute(path: AppRoutes.workerConfirmed, builder: (_, __) => const WorkerConfirmedScreen()),
    GoRoute(path: AppRoutes.businessOnboarding, builder: (_, __) => const BusinessOnboardingScreen()),
    GoRoute(path: AppRoutes.documentUpload, builder: (_, __) => const DocumentUploadScreen()),
    GoRoute(path: AppRoutes.verifiedBusiness, builder: (_, __) => const VerifiedBusinessScreen()),
    GoRoute(path: AppRoutes.employerSettings, builder: (_, __) => const EmployerSettingsScreen()),
    GoRoute(path: AppRoutes.editBusinessProfile, builder: (_, __) => const EditBusinessProfileScreen()),
    GoRoute(path: AppRoutes.shiftTemplates, builder: (_, __) => const ShiftTemplatesScreen()),
    GoRoute(path: AppRoutes.workerPreferences, builder: (_, __) => const WorkerPreferencesScreen()),
    GoRoute(path: AppRoutes.employerNotifications, builder: (_, __) => const EmployerNotificationsScreen()),
    GoRoute(path: AppRoutes.billing, builder: (_, __) => const BillingScreen()),
  ],
);
