cask 'sensiblesidebuttons-fork' do
  version "1.0.10"
  auto_updates false
  url "https://github.com/Cyberbeni/sensible-side-buttons/archive/refs/tags/#{version}.tar.gz"
  sha256 "4874153fec2b3f6b8d813eef68f00cf3d1fbafd3d997e17968478348fbb8410b"
  conflicts_with cask: "sensiblesidebuttons"

  preflight do
    arch = `uname -m`.chomp
    system "xcodebuild", "-project", "#{staged_path}/sensible-side-buttons-#{version}/SwipeSimulator.xcodeproj", "-scheme", "SensibleSideButtons", "-configuration", "Release", "-derivedDataPath", "#{staged_path}/.build", "-IDEBuildLocationStyle=Unique", "-arch", arch, "build"
  end

  app ".build/Build/Products/Release/SensibleSideButtons.app"
end
