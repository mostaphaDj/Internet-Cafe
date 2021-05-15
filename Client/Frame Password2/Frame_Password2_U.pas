unit Frame_Password2_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrame_Password2 = class(TFrame)
    Image5: TImage;
    Edit_Entere_pseudonyme: TEdit;
    ImageEntere_pseudonyme: TImage;
    Label_Entere_Nam: TLabel;
    Image6: TImage;
    Edit_Mot_Passe: TEdit;
    ImagePassword: TImage;
    Label_MotPasse: TLabel;
    Image4: TImage;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Next;
  end;

implementation

{$R *.dfm}
{ TFrame_Password2 }

procedure TFrame_Password2.Next;
begin

end;

end.
