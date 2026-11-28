#ifndef Payload
  #define Payload "..\..\artifact"
#endif

[Setup]
AppId={{F6A28DB5-9542-4A5C-8FD8-5AA9C095B25F}
AppName=YoruGram Desktop (Test)
AppVersion=0.1.0
AppPublisher=YoruGram
DefaultDirName={localappdata}\Programs\YoruGram
DefaultGroupName=YoruGram Desktop
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
MinVersion=10.0
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\YoruGram.exe
LicenseFile={#Payload}\LICENSE
OutputBaseFilename=YoruGram-Setup-Test
Compression=lzma2/fast
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "{#Payload}\YoruGram.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#Payload}\LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#Payload}\LEGAL"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\YoruGram Desktop\YoruGram"; Filename: "{app}\YoruGram.exe"
