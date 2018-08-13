cask 'reveal13' do
  version '13'
  sha256 '1cdae698fe0dd3d7d0f457fb572fc063dc006efa0c9a9b59e6beabebb65099ff'
  url "https://download.revealapp.com/Reveal.app-#{version}.zip"
  name 'Reveal'
  homepage 'https://revealapp.com/'
  depends_on macos: '>= :sierra'
  app 'Reveal.app'
end
