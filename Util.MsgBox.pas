unit Util.MsgBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TTipoMsg = (tpErro, tpErroFatima, tpErroExter, tpYesNo, tpOK);

function MsgBox(AMsg: string; ATipo: TTipoMsg):boolean; overload;
function MsgBox(AFileImg, AMsg: string; ATipo: TTipoMsg):boolean; overload;

type
  TfrmMsgBox = class(TForm)
    pnVisual: TPanel;
    pnBotoes: TPanel;
    img: TImage;
    mmTexto: TMemo;
    spButSIM: TSpeedButton;
    spButNAO: TSpeedButton;
    spdButOK: TSpeedButton;
    giFatima: TImage;
    imgErro: TImage;
    imgPergunta: TImage;
    imgCerto: TImage;
    gifExterminador: TImage;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure spButSIMClick(Sender: TObject);
    procedure spButNAOClick(Sender: TObject);
  private
    { Private declarations }
    class var FInstance: TfrmMsgBox;
    class var FStatus: boolean;
    FResultado: boolean;

    procedure SetMsg(AMsg: string);
    procedure SetImg(AFile: string); overload;
    procedure SetImg(APicture: TPicture); overload;
    procedure AtivarGif();
  public
    { Public declarations }
    destructor destroy; override;
    class function GetInstance: TfrmMsgBox;

  end;

implementation

{$R *.dfm}

procedure TfrmMsgBox.AtivarGif;
begin
  Self.img.Stretch := true;
  //verificar se uma classe é uma subclasse de outra
  if Self.img.Picture.Graphic.InheritsFrom(TGIFImage) then
  begin
      (Self.img.Picture.Graphic as TGIFImage).Animate := True;
      Self.img.Stretch := false;
  end;
end;

destructor TfrmMsgBox.destroy;
begin
  FStatus := False;
  inherited;
end;

procedure TfrmMsgBox.FormCreate(Sender: TObject);
begin
  FStatus := True;
  FResultado := False;
  AtivarGif();
end;

class function TfrmMsgBox.GetInstance: TfrmMsgBox;
begin
  if not Self.FStatus or  not Assigned(Self.FInstance) then
    Application.CreateForm(TfrmMsgBox, FInstance);

  result := Self.FInstance;
end;

procedure TfrmMsgBox.SetImg(AFile: string);
begin
   Self.img.Picture.LoadFromFile(AFile);

   AtivarGif();
end;

procedure TfrmMsgBox.SetImg(APicture: TPicture);
begin
   Self.img.Picture := APicture;

   AtivarGif();
end;

procedure TfrmMsgBox.SetMsg(AMsg: string);
begin
   Self.mmTexto.Lines.Clear;
   Self.mmTexto.Lines.Append(AMsg);
end;

procedure TfrmMsgBox.spButSIMClick(Sender: TObject);
begin
  FResultado := True;
  FInstance.Close;
end;

procedure TfrmMsgBox.spButNAOClick(Sender: TObject);
begin
  FResultado := False;
  FInstance.Close;
end;

procedure configMsgImg(AFrmMsg: TfrmMsgBox; ATipo: TTipoMsg);
begin

  AFrmMsg.spButSIM.Visible := false;
  AFrmMsg.spButNAO.Visible := false;
  AFrmMsg.spdButOK.Visible := false;

  case ATipo of
    tpErro: begin
                AFrmMsg.Caption := 'ERRO';
                AFrmMsg.SetImg(AFrmMsg.imgErro.Picture);
                AFrmMsg.spdButOK.Visible := true;
            end;
    tpErroFatima: begin
                      AFrmMsg.Caption := 'ERRO';
                      AFrmMsg.SetImg(AFrmMsg.giFatima.Picture);
                      AFrmMsg.spdButOK.Visible := true;
                  end;
    tpErroExter: begin
                      AFrmMsg.Caption := 'ERRO';
                      AFrmMsg.SetImg(AFrmMsg.gifExterminador.Picture);
                      AFrmMsg.spdButOK.Visible := true;
                  end;
      tpOK: begin
                AFrmMsg.Caption := 'CONFIRMAÇÃO';
                AFrmMsg.SetImg(AFrmMsg.imgCerto.Picture);
                AFrmMsg.spdButOK.Visible := true;
            end;
    tpYesNo: begin
                AFrmMsg.Caption := 'ESCOLHA';
                AFrmMsg.SetImg(AFrmMsg.imgPergunta.Picture);
                AFrmMsg.spButSIM.Visible := true;
                AFrmMsg.spButNAO.Visible := true;
             end;
  end;
end;

procedure configMsg(AFrmMsg: TfrmMsgBox; ATipo: TTipoMsg);
begin

  AFrmMsg.spButSIM.Visible := false;
  AFrmMsg.spButNAO.Visible := false;
  AFrmMsg.spdButOK.Visible := false;

  case ATipo of
    tpErro: begin
                AFrmMsg.Caption := 'ERRO';
                AFrmMsg.spdButOK.Visible := true;
            end;
      tpOK: begin
                AFrmMsg.Caption := 'CONFIRMAÇÃO';
                AFrmMsg.spdButOK.Visible := true;
            end;
    tpYesNo: begin
                AFrmMsg.Caption := 'ESCOLHA';
                AFrmMsg.spButSIM.Visible := true;
                AFrmMsg.spButNAO.Visible := true;
             end;
  end;
end;

//function static
function MsgBox(AMsg: string; ATipo: TTipoMsg):boolean;
var
  VFrmMsg: TfrmMsgBox;
begin
  VFrmMsg := TfrmMsgBox.GetInstance();

  configMsgImg(VFrmMsg, ATipo);
  VFrmMsg.SetMsg(AMsg);

  VFrmMsg.ShowModal;
  result := VFrmMsg.FResultado;
  VFrmMsg.Destroy;
end;

function MsgBox(AFileImg, AMsg: string; ATipo: TTipoMsg):boolean;
var
  VFrmMsg: TfrmMsgBox;
begin
  VFrmMsg := TfrmMsgBox.GetInstance();

  VFrmMsg.SetImg(AFileImg);
  configMsg(VFrmMsg, ATipo);
  VFrmMsg.SetMsg(AMsg);

  VFrmMsg.ShowModal;
  result := VFrmMsg.FResultado;
  VFrmMsg.Destroy;
end;

end.
