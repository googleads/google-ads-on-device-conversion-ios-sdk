Pod::Spec.new do |s|
    s.name             = 'GoogleAdsOnDeviceConversion'
    s.version          = '2.2.0'
    s.summary          = <<-SUMMARY
    On device conversion measurement plugin for FirebaseAnalytics and Google's
    App Attribution Partner (AAP) SDKs.
    SUMMARY

    s.description      = <<-DESC
    On device conversion measurement plugin for FirebaseAnalytics and Google's
    App Attribution Partner (AAP) SDKs. This pod isn't intended for direct use
    by App developers.
    DESC

    s.homepage         = 'https://developers.google.com/ios'
    s.license          = { :type => 'Copyright', :text => 'Copyright 2024 Google' }
    s.authors          = 'Google, Inc.'

    s.source           = {
        :http => 'https://dl.google.com/firebase/ios/appads/2.2.0/GoogleAdsOnDeviceConversion-2.2.0.tar.gz'
    }

    s.cocoapods_version = '>= 1.12.0'

    s.ios.deployment_target  = '12.0'

    s.libraries  = 'c++'

    s.dependency 'GoogleUtilities/Logger', '~> 8.1'
    s.dependency 'GoogleUtilities/Network', '~> 8.1'
    s.dependency 'nanopb', '~> 3.30910.0'

    s.vendored_frameworks = 'Frameworks/GoogleAdsOnDeviceConversion.xcframework'
end
