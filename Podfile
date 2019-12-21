inhibit_all_warnings!
use_frameworks!

# Pods
def reswift; pod 'ReSwift', '~> 5.0.0'; end
def fakery; pod 'Fakery', '~> 4.1.1'; end

target 'Yearvu' do
  platform :ios, '13.0'

  reswift
  fakery

  # Pods for Yearvu
  target 'YearvuTests' do
    inherit! :search_paths
    fakery
    # Pods for testing
  end

  target 'YearvuUITests' do
    # Pods for testing
  end
end
