cask 'sensiblesidebuttons-fork' do
  version "1.0.11"
  auto_updates false
  url "https://github.com/Cyberbeni/sensible-side-buttons/archive/refs/tags/#{version}.tar.gz"
  sha256 "3158aded2e00e18f0d9e81502967e357ad46ffb303f69b2129b37fc40644fc56"
  conflicts_with cask: "sensiblesidebuttons"

  preflight do
    arch = `uname -m`.chomp
    system "xcodebuild", "-project", "#{staged_path}/sensible-side-buttons-#{version}/SwipeSimulator.xcodeproj", "-scheme", "SensibleSideButtons", "-configuration", "Release", "-derivedDataPath", "#{staged_path}/.build", "-IDEBuildLocationStyle=Unique", "-arch", arch, "build"
  end

  app ".build/Build/Products/Release/SensibleSideButtons.app"
end
