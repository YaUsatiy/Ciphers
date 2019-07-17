unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    grp1: TGroupBox;
    edt_p: TEdit;
    edt_q: TEdit;
    edt_x: TEdit;
    edt_k: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    bt_generate: TButton;
    bt_Exit: TButton;
    grp2: TGroupBox;
    bt1: TButton;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    bt_Main: TButton;
    dlgOpen1: TOpenDialog;
    progressbar1: TProgressBar;
    grp3: TGroupBox;
    bt3: TButton;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    bt2: TButton;
    edt_h: TEdit;
    lbl23: TLabel;
    procedure bt_ExitClick(Sender: TObject);
    procedure edt_pKeyPress(Sender: TObject; var Key: Char);
    procedure bt_generateClick(Sender: TObject);
    procedure bt_MainClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  p, q, x, k, g, y, r, s, w, u1, u2, v, h, sch_1, sch_2: Cardinal;
  drob : Extended;
  NameOfFile : string;

implementation

{$R *.dfm}

procedure TForm1.bt_ExitClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.edt_pKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8]) then
  Key:=#0;
end;

function prostoe(a:Cardinal):Boolean;
var
  j : Cardinal;
begin
  Result:=True;
  for j:=a-1 downto 2 do
    if (a mod j = 0) then
    begin
      Result:=False;
      //ShowMessage(IntToStr(j));
      exit;
    end;
end;

function modinv (a,m:Cardinal):Cardinal;
var
i,b:integer;         //Вот здесь используется так называемый
x,j,y,c:integer;     //"расширенный алгоритм Евклида".
begin                //Возвращает такое D, что (E*D) mod N =1 или же d=e^-1 mod N
 b := m;
 c := a;
 i := 0;
 j := 1;
 while (c <> 0) do
  begin
   x := b div c;
   y := b mod c;
   b := c;
   c := y;
   y := j;
   j := i - j * x;
   i := y
  end;
 if (i < 0) then i := i+m;
 modinv:=i;
end;

function fast_exp(a,z,n : Cardinal): Cardinal;
var
  a1, z1, x : Cardinal;
begin
  a1:=a;
  z1:=z;
  x:=1;
  while z1<>0 do
  begin
    while (z1 mod 2)=0 do //возводим в кварат a1, пока z чётно
    begin
      z1:=z1 div 2;
      a1:=(a1*a1) mod n;
    end;
    z1:=z1-1;
    x:=(x*a1) mod n;      //умножение
  end;
  fast_exp:=x;
end;

procedure TForm1.bt_generateClick(Sender: TObject);
begin
  if (edt_q.Text='')or(edt_p.Text='')or(edt_x.Text='')or(edt_k.Text='')or (edt_h.Text='') then
  begin
    messagebox(Form1.Handle, pchar('Заполните все поля! Ни одно поле не должно быть пустым!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  h:=StrToInt(edt_h.Text);
  if (h<=1) or (h>=p-1) then
  begin
    messagebox(Form1.Handle, pchar('Число h должно удовлетворять требованиям 1<h<p-1! Повторите ввод числа h!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  q:=StrToInt(edt_q.Text);
  if not(prostoe(q)) then
  begin
    messagebox(Form1.Handle, pchar('Число q должно быть простым! Повторите ввод числа q!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;
  if (q=0) then
  begin
    messagebox(Form1.Handle, pchar('Число q не должно быть равным нулю или меньше! Повторите ввод числа q!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  p:=StrToInt(edt_p.Text);
  if not(prostoe(p)) then
  begin
    messagebox(Form1.Handle, pchar('Число p должно быть простым! Повторите ввод числа p!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;
  if ((p-1) mod q)<>0 then
  begin
    messagebox(Form1.Handle, pchar('Число q должно быть делителем для числа (p-1)! Повторите ввод числа q!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  x:=StrToInt(edt_x.Text);
  if ((x<=0) or (x>=q)) then
  begin
    messagebox(Form1.Handle, pchar('Число x должно удовлетворять требованию 0<x<q! Повторите ввод числа x!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  k:=StrToInt(edt_k.Text);
  if ((k<=0) or (k>=q)) then
  begin
    messagebox(Form1.Handle, pchar('Число k должно удовлетворять требованию 0<k<q! Повторите ввод числа k!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;

  drob:= ((p-1)/q);
  g:=fast_exp(h,Trunc(drob),p);
  if (g<=1) then
  begin
    messagebox(Form1.Handle, pchar('Число g должно быть строго больше 1 (g>1)!'), pchar('Ошибка'), mb_ok+mb_iconerror);
    Exit;
  end;
  lbl7.Caption:=IntToStr(g);

  y:=fast_exp(g,x,p);
  lbl8.Caption:=IntToStr(y);

  bt_Main.Enabled:=True;
  bt3.Enabled:=True;

end;

procedure Initialize(edt_x,edt_p,edt_q,edt_k, edt_h:TEdit);
begin
  p:=StrToInt(edt_p.Text);
  q:=StrToInt(edt_q.Text);
  x:=StrToInt(edt_x.Text);
  k:=StrToInt(edt_k.Text);
  h:=StrToInt(edt_h.Text);
  drob:= ((p-1)/q);
  g:=fast_exp(h,Trunc(drob),p);
  y:=fast_exp(g,x,p);
end;

procedure TForm1.bt_MainClick(Sender: TObject);
var
  F : file of byte;
  by : byte;
  i, H: Cardinal;
  str: string;
begin
  Initialize(edt_x,edt_p,edt_q,edt_k,edt_h);

  dlgOpen1.InitialDir:='C:\Users\Ваня\Desktop\ЭЦП\';

  if dlgOpen1.Execute then
  begin
    AssignFile(F, dlgOpen1.FileName);
    NameOfFile:=dlgOpen1.FileName;
    //ext:=Copy(dlgOpen1.FileName,Pos('.',dlgOpen1.FileName),Length(dlgOpen1.FileName)-Pos('.',dlgOpen1.FileName)+1);
    Reset(F);

    H:=100;
    If FileSize(F)<>0 then
    begin
      ProgressBar1.Min:=1;
      ProgressBar1.Max:=FileSize(F);
      progressbar1.Step:=1;
      progressbar1.Position:=1;
      repeat
        read(F,by);
        {if (by <= q) then
          begin
            messagebox(Form1.Handle, pchar('Число q должно быть большим простым для прдотвращения коллизии! Повторите ввод числа q!'), pchar('Ошибка'), mb_ok+mb_iconerror);
            Exit;
          end;  }
        H:=(( (H+By)*(H+By) ) mod q);
        progressbar1.position:=progressbar1.position+1;
      until (EOF(F));
    end
    else
    while (not(EOF(F))) do
    begin
        read(F,by);
        H:=(( (H+By)*(H+By) ) mod q);
    end;

    lbl10.Caption:='h(M) = ' + IntToStr(H)+' / ' + IntToHex(H,1);;

    r:=( fast_exp(g,k,p) mod q );
    s:= (fast_exp(k,q-2,q)* ( (H+x*r) mod q ))mod q ;
    if ( (r=0) or (s=0) ) then
    begin
      messagebox(Form1.Handle, pchar('Значение r или s равно 0! Повторите ввод числа k!'), pchar('Ошибка'), mb_ok+mb_iconerror);
      Exit;
    end;

    by:=13;
    write(f,by);
    by:=10;
    write(f,by);

    sch_1:=2;
    str:=IntToStr(r);
    for i:=1 to Length(str) do
    begin
      case str[i] of
        '0':
        begin
          by:=48;
          write(f,by);
        end;
        '1':
        begin
          by:=49;
          write(f,by);
        end;
        '2':
        begin
          by:=50;
          write(f,by);
        end;
        '3':
        begin
          by:=51;
          write(f,by);
        end;
        '4':
        begin
          by:=52;
          write(f,by);
        end;
        '5':
        begin
          by:=53;
          write(f,by);
        end;
        '6':
        begin
          by:=54;
          write(f,by);
        end;
        '7':
        begin
          by:=55;
          write(f,by);
        end;
        '8':
        begin
          by:=56;
          write(f,by);
        end;
        '9':
        begin
          by:=57;
          write(f,by);
        end;
      end;
      inc(sch_1);
    end;

    by:=Ord('/');
    Write(f,by);
    Inc(sch_1);

    sch_2:=0;
    str:=IntToStr(s);
    for i:=1 to Length(str) do
    begin
      case str[i] of
        '0':
        begin
          by:=48;
          write(f,by);
        end;
        '1':
        begin
          by:=49;
          write(f,by);
        end;
        '2':
        begin
          by:=50;
          write(f,by);
        end;
        '3':
        begin
          by:=51;
          write(f,by);
        end;
        '4':
        begin
          by:=52;
          write(f,by);
        end;
        '5':
        begin
          by:=53;
          write(f,by);
        end;
        '6':
        begin
          by:=54;
          write(f,by);
        end;
        '7':
        begin
          by:=55;
          write(f,by);
        end;
        '8':
        begin
          by:=56;
          write(f,by);
        end;
        '9':
        begin
          by:=57;
          write(f,by);
        end;
      end;
      inc(sch_2);
    end;

    lbl12.Caption:='r='+ IntToStr(r)+' - ' + 's='+ IntToStr(s);

    CloseFile(F);
    MessageBeep(MB_OK);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edt_q.Text:='107';
  edt_p.Text:='643';
  edt_x.Text:='45';
  edt_k.Text:='31';
  edt_h.Text:='2';
  bt_Main.Enabled:=False;
  bt3.Enabled:=False;
end;


procedure TForm1.bt3Click(Sender: TObject);
var
  F : File of Byte;
  by : Byte;
  i, H, konec: Cardinal;
begin
  try
  Initialize(edt_x,edt_p,edt_q,edt_k,edt_h);

  dlgOpen1.InitialDir:='C:\Users\Ваня\Desktop\ЭЦП\';

  if dlgOpen1.Execute then
  begin
    AssignFile(F, dlgOpen1.FileName);
    //ext:=Copy(dlgOpen1.FileName,Pos('.',dlgOpen1.FileName),Length(dlgOpen1.FileName)-Pos('.',dlgOpen1.FileName)+1);
    Reset(F);

    H:=100;
    if (dlgOpen1.FileName = NameOfFile) then
      konec:=Filesize(F)-sch_1-sch_2
    else
      konec:=FileSize(F);

    i:=0;

    If FileSize(F)<>(sch_1+sch_2) then
    begin
      ProgressBar1.Min:=1;
      ProgressBar1.Max:=konec;
      progressbar1.Step:=1;
      progressbar1.Position:=1;
      repeat
        read(F,By);
        H:=(( (H+By)*(H+By) ) mod q);
        progressbar1.position:=progressbar1.position+1;
        inc(i);
      until (i>=konec);
    end
    else
    while (i<Konec) do
    begin
        read(F,By);
        H:=(( (H+By)*(H+By) ) mod q);
        Inc(i);
    end;

    lbl16.Caption:='h(M) = ' + IntToStr(H)+' / ' + IntToHex(H,1);

    w:=modinv(s,q);
    //w:=fast_exp(s,q-2,q);

    u1:=(H*w) mod q;
    u2:=(r*w) mod q;
    v:= ( ( fast_exp(g,u1,p)*fast_exp(y,u2,p) ) mod p) mod q;
    lbl13.Caption:=IntToStr(v);
    lbl17.Caption:=IntToStr(u1);
    lbl18.Caption:=IntToStr(u2);
    lbl21.Caption:=IntToStr(w);

    if (r=v) then
      messagebox(Form1.Handle, pchar('Подпись является подлинной, так как r = v = '+inttostr(v)), pchar('Верно'), mb_ok+mb_iconinformation)
    else
      messagebox(Form1.Handle, pchar('Подпись подделана, так как r <> v ('+IntToStr(r)+' <> '+IntToStr(v)+')'), pchar('Ошибка'), mb_ok+mb_iconerror);

    CloseFile(F);
  end;
  except
    messagebox(Form1.Handle, pchar('Подпись подделана, так как r <> v'), pchar('Ошибка'), mb_ok+mb_iconerror);
  end;
end;

end.
