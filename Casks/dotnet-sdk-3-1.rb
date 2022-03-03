cask "dotnet-sdk-3-1" do
  if MacOS.version <= :sierra
    version "2.2.402,7430e32b-092b-4448-add7-2dcf40a7016d:1076952734fbf775062b48344d1a1587"
    url "https://download.visualstudio.microsoft.com/download/pr/7430e32b-092b-4448-add7-2dcf40a7016d/1076952734fbf775062b48344d1a1587/dotnet-sdk-2.2.402-osx-x64.pkg"
    #sha256 "e74d816bc034d0fcdfa847286a6cad097227d4864da1c97fe801012af0c26341"
    sha256 :no_check
  else
    version "3.1.403,b4db3ee6-91da-4dd3-a279-37c45d9627b7:fad88a7335d374d6e4d53aef085f4b24"
    url "https://download.visualstudio.microsoft.com/download/pr/b4db3ee6-91da-4dd3-a279-37c45d9627b7/fad88a7335d374d6e4d53aef085f4b24/dotnet-sdk-3.1.403-osx-x64.pkg"
    #sha256 "6b4f384b8a724bab114e0685285a98003ed21227acfb3c6ff0dc083d981812fc"
    sha256 :no_check
  end

  appcast "https://www.microsoft.com/net/download/macos"
  name ".NET Core SDK"
  homepage "https://www.microsoft.com/net/core#macos"

  depends_on macos: ">= :sierra"

  pkg "dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
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
