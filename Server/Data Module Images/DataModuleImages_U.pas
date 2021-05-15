unit DataModuleImages_U;

interface

uses
  SysUtils, Classes, ImgList,pngimage, Controls;

type
  TDataModuleImages = class(TDataModule)
    ImageListSmallPost: TImageList;
    ImageListLargePost: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleImages: TDataModuleImages;

Const
  SOutsideDomaine = 0;
  SLock = 1;
  SLockDesconnected = 2;
  SLockShutDown = 3;
  SLockRestart = 4;
  SUnLock = 5;
  SUnLockDesconnected = 6;
  SUnLockRestart = 7;
  SUnLockShutDown = 8;
  SUnLockUser = 9;
  SUnLockDesconnectedUser = 10;
  SUnLockRestartUser = 11;
  SUnLockShutDownUser = 12;
  SUnLockPartTime = 13;
  SUnLockPartTimeDesconnected = 14;
  SUnLockPartTimeRestart = 15;
  SUnLockPartTimeShutDown = 16;
  SUnLockPartTimeUser = 17;
  SUnLockPartTimeDesconnectedUser = 18;
  SUnLockPartTimeRestartUser = 19;
  SUnLockPartTimeShutDownUser = 20;
  SUser = 21;

var
  PngImageTrue : TPngImage;
  PngImageFalse : TPngImage;

implementation

{$R *.dfm}

procedure TDataModuleImages.DataModuleCreate(Sender: TObject);
begin
  PngImageTrue := TPngImage.Create;
  PngImageFalse := TPngImage.Create;
  PngImageTrue.LoadFromFile('Data\True.png');
  PngImageFalse.LoadFromFile('Data\False.png');
end;

procedure TDataModuleImages.DataModuleDestroy(Sender: TObject);
begin
  PngImageTrue.Free;
  PngImageFalse.Free;
end;


end.
