cask "dotnet-sdk-3-1" do
  version "3.1.416"
  # sha256 "6b4f384b8a724bab114e0685285a98003ed21227acfb3c6ff0dc083d981812fc"

  sha256 :no_check

  url "https://download.visualstudio.microsoft.com/download/pr/895b7e35-b1c2-4d1d-8d7f-f82f4ae70eb7/9470e66ca28443328cbaa36963ff83f8/dotnet-sdk-{version}-osx-x64.tar.gz"
  appcast "https://www.microsoft.com/net/download/macos"
  name ".NET Core SDK"
  homepage "https://www.microsoft.com/net/core#macos"

  depends_on macos: ">= :sierra"

  pkg "dotnet-sdk-{version}-osx-x64.tar.gz"
  binary "/usr/local/share/dotnet/dotnet"

  uninstall pkgutil: [
              "com.microsoft.dotnet.*",
              "com.microsoft.netstandard.pack.targeting.*",
            ],
            delete:  [
              "/etc/paths.d/dotnet",
              "/etc/paths.d/dotnet-cli-tools",
            ]

  zap trash: [
    "~/.dotnet",
    "~/.nuget",
  ]
end
