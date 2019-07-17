unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls, jpeg, Grids;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    OpenDialog1: TOpenDialog;
    bt1: TButton;
    lbl2: TLabel;
    Edit1: TEdit;
    mm1: TMainMenu;
    N1: TMenuItem;
    img1: TImage;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    Button1: TButton;
    bt2: TButton;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure bt1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure bt2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  binCipher, binPlain: string;
  extencion:string;

implementation
var
  index:Integer;

{$R *.dfm}

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'1',#8]) then
  Key := #0;
end;
procedure LFSR(const _LengthOfText : Integer); //генерация псевдослучайной последовательности ключа
var
  i, j, h : Integer;
  Reg: String;
  Bit_30, tmp : string[1];
begin
  try
  Reg:=Form1.Edit1.Text;

    for i:=0 to (_LengthOfText-2) do
      begin
        Bit_30:=Reg[1];

        h:=(StrToInt(Bit_30) xor StrToInt(reg[15]) xor StrToInt(reg[16]) xor StrToInt(reg[30]));

        for j:=1 to 29 do
          Reg[j]:=Reg[j+1];

        tmp:='';
        tmp:=inttostr(h);
        Insert(tmp,reg,30);// в младший разряд

        Form1.StringGrid1.Cells[i,1]:=Bit_30;
        If Index<=64 then
            Form1.Memo2.Text:=Form1.Memo2.Text+Bit_30
      end;

    for i:=0 to (_LengthOfText-2) do
      if Form1.StringGrid1.Cells[i,1]=Form1.StringGrid1.Cells[i,0] then
        begin
          Form1.StringGrid1.Cells[i,2]:='0';
          If Index<=64 then
            Form1.Memo3.Text:=Form1.Memo3.Text+'0'
        end
      else
        begin
          Form1.StringGrid1.Cells[i,2]:='1';
          If Index<=64 then
            Form1.Memo3.Text:=Form1.Memo3.Text+'1'
        end;
 except
   ShowMessage('ERROR');
 end;
end;

procedure BinToStr(const _LengthOfText: Integer);
var
  Bincode : String;
  i, j, k, l, bit : Integer;
  F : File of byte;
  b : Byte;
begin
  AssignFile(F, 'cyphered(decyphered) text');
  Reset(F);
  Seek(F,Index);
  j:=0;

  repeat
    BinCode:='';
    b:=0;
    l:=1;

    for i:=i to i+7 do
      BinCode:=BinCode+Form1.StringGrid1.Cells[i,2];

    repeat

      If (BinCode[l]='1') and (l<8) then
        begin
          bit:=2;
          for k:=8 downto (l+2) do
            bit:=bit*2;
          b:=b+bit
        end;

      If (BinCode[l]='1') and (l=8) then
        b:=b+1;

      l:=l+1
    until l>8;

    Write(F,b);

  until i>(_LengthOfText-2);

  CloseFile(F);

end;

procedure TForm1.bt1Click(Sender: TObject);
var
  S, ReverseBin, BinCode : String;
  i, j : Integer;
  F : File of Byte;
  b : Byte;
begin
  if Length(Edit1.Text)<30 then
  begin
    messagebox(Form1.Handle, pchar('Некорректные данные! Начальное положение регистра должно содержать не менее 30 бит!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  try
  OpenDialog1.InitialDir:='C:\Users\Ваня\Desktop\форма\';
  OpenDialog1.FileName:='';
  If OpenDialog1.Execute then
    j:=0;
  If (OpenDialog1.FileName<>'') and (Length(Edit1.Text)=30) then
    begin
    Index:=0;
    AssignFile(F, OpenDialog1.FileName);
    Reset(F);
    StringGrid1.Cells[0,0]:='';
    StringGrid1.Cells[1,0]:='';
    StringGrid1.Cells[2,0]:='';
    Memo1.Text:='';
    Memo2.Text:='';
    Memo3.Text:='';
    repeat
      StringGrid1.ColCount:=1;
      If FileSize(F)<>0 then
        Repeat
          Read(F, b);
          StringGrid1.ColCount:=StringGrid1.ColCount+8;
          BinCode:='';
          ReverseBin:='';

          repeat
            ReverseBin:=ReverseBin+IntToStr(b mod 2);
            b:=b div 2;
          until b=0;

          while Length(ReverseBin)<>8 do
            ReverseBin:=ReverseBin+'0';

          for i:=8 downto 1 do
            BinCode:=BinCode+ReverseBin[i];

          i:=1;
          for j:=j to (j+7) do
            begin
              StringGrid1.Cells[j,0]:=BinCode[i];
              If Index<=64 then
                Memo1.Text:=Memo1.Text+BinCode[i];
              i:=i+1;
            end;

        until (j>1022) or (EoF(F));         //шифрую блоком по 128 байт

      If StringGrid1.ColCount>1 then
        begin
          LFSR(StringGrid1.ColCount);
          BinToStr(StringGrid1.ColCount);
        end
      else
      begin
        StringGrid1.Cells[0,0]:='';
        StringGrid1.Cells[1,0]:='';
        StringGrid1.Cells[2,0]:='';
        ShowMessage('Сообщение пустое');
      end;

    j:=0;
    Index:=Index+128;
    until EoF(F);
    CloseFile(F);
    end

  else
    If (Length(Edit1.Text)<>30) then
      ShowMessage('Введите начальное положение регистра длиной в 30 бит');

  except
    ShowMessage('ERROR');
  end;
  MessageBeep(MB_OK);
end;


procedure TForm1.N1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
edit1.Text:='101101111001111110011101111110';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  F : File of Byte;
begin
  AssignFile(F, 'cyphered(decyphered) text');
  Rewrite(F);
  CloseFile(F);
end;

procedure TForm1.bt2Click(Sender: TObject);
begin
  Form1.Close;
end;

end.
