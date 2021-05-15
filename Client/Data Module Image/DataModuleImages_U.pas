unit DataModuleImages_U;

interface

uses
  SysUtils, Classes,pngimage;

type
  TDataModuleImages = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleImages: TDataModuleImages;
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
