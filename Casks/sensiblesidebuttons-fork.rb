cask 'sensiblesidebuttons-fork' do
  version "1.0.9"
  auto_updates false
  url "https://github.com/Cyberbeni/sensible-side-buttons/archive/refs/tags/#{version}.tar.gz"
  sha256 "783d45c1078fab4284f8d4d3c27fdf9d6e9d1ce933261298d79c839eb60175d0"
  conflicts_with cask: "sensiblesidebuttons"

  preflight do
    arch = `uname -m`.chomp
    system "xcodebuild", "-project", "#{staged_path}/sensible-side-buttons-#{version}/SwipeSimulator.xcodeproj", "-scheme", "SensibleSideButtons", "-configuration", "Release", "-derivedDataPath", "#{staged_path}/.build", "-IDEBuildLocationStyle=Unique", "-arch", arch, "build"
  end

  app ".build/Build/Products/Release/SensibleSideButtons.app"
end
