# MsgBoxPersonal

Classe criada para exibir mensagens personalizadas. Nela é possivel exibir fotos e gif animados. O texto que é exibido tambem pode ser copiado facilmente.

![image](https://github.com/andreCLima/MsgBoxPersonal/blob/main/image.png)

![image](https://github.com/andreCLima/MsgBoxPersonal/blob/main/image2.png)


# 🔨: Funcionalidades do projeto

- `MsgBox('seu texto', tpYesNo)`: Mensagem com pergunta de sim ou não 
- `MsgBox('seu texto', tpErro)`: Mensagem de erro com a opção de ok
- `MsgBox('seu texto', tpOk)`: Mensagem de confirmção com a opção de ok


# 🦾: Exemplo de uso
```pascal
{$R *.dfm}

uses Util.MsgBox;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if MsgBox('Deseja continuar?', tpYesNo) then
    ShowMessage('ok');
end;
```

# Autor

[<img src="https://avatars.githubusercontent.com/u/90877034?v=4" width=115><br><sub>André Lima</sub>](https://github.com/andreCLima)





