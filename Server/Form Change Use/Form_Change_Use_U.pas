unit Form_Change_Use_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm_Change_Use = class(TForm)
    ListView1: TListView;
    Button_Ok: TButton;
    Button_Cancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form_Change_Use: TForm_Change_Use;

implementation

uses Form_ListView_Post_Client_U, Type_U, Classes_U, DataModuleImages_U;
{$R *.dfm}

procedure TForm_Change_Use.FormClose(Sender: TObject; var Action: TCloseAction);
var
  PostIndex: Integer;
begin
  for PostIndex := 0 to ListView1.Items.Count - 1 do
  begin
    ListView1.Items[PostIndex].Data := nil;
  end;
end;

procedure TForm_Change_Use.FormCreate(Sender: TObject);
var
  PostIndex: Integer;
begin
  for PostIndex := 0 to Form_ListView_Post_Client.ListView1.Items.Count - 1 do
  begin
    if (TUnitObjets(Form_ListView_Post_Client.ListView1.Items.Item[PostIndex]
          .Data).Use = nil) and
      (Form_ListView_Post_Client.ListView1.ItemIndex <> PostIndex) then
    begin
      with ListView1.Items.Add do
      begin
        ImageIndex := Form_ListView_Post_Client.ListView1.Items.Item[PostIndex]
          .ImageIndex;
        Data := Form_ListView_Post_Client.ListView1.Items.Item[PostIndex].Data;
      end;
    end;
  end;
end;

end.
