cask 'sensiblesidebuttons' do
  version "1.0.8"
  auto_updates false
  url "https://github.com/Cyberbeni/sensible-side-buttons/archive/refs/tags/#{version}.tar.gz"
  sha256 "9e9043ad935c477c974362ea3ade20c0fb3d6bb9f62f4db9af03ea61a145eca1"

  preflight do
    arch = `uname -m`.chomp
    system "xcodebuild", "-project", "#{staged_path}/sensible-side-buttons-#{version}/SwipeSimulator.xcodeproj", "-scheme", "SensibleSideButtons", "-configuration", "Release", "-derivedDataPath", "#{staged_path}/.build", "-IDEBuildLocationStyle=Unique", "-arch", arch, "build"
  end

  app ".build/Build/Products/Release/SensibleSideButtons.app"
end
