#script(kid) para diminuir tamanho de uma conta cPanel antes de migrar. No meu primeiro uso consegui reduzir de 88gb para 2gb. 

#ATENÇÃO! antes de executar avise seu cliente e tenha certeza que ele fez backup dos emails.

# 1 - login root via ssh ( não tenha medo )

# 2 - entrar na pasta onde ficam os emails
cd /home/cpanel-user/mail/dominio.com.br

# 3 - listar os usuários mais espaçosos
du -hsx * | sort -rh | head -20

#vc vai obter uma lista parecida com essa
31G     carol
21G     beltrano
4.7G    marilza
3.3G    anapaula
3.2G    pedrofernandes
2.6G    everton
2.3G    beatriz
2.2G    vistoria
1.8G    adm
962M    vanessa
934M    fulano
840M    vendassg
702M    roseli
506M    ciclano

# 4 - pra casa usuário acima limpar a pasta dele

for MAIL_USER in anapaula pedrofernandes everton beatriz vistoria adm vanessa fulano vendassg roseli ciclano
do
	echo "Limpando pasta $MAIL_USER/new"
	rm -f $MAIL_USER/new/*
	
	echo "Limpando pasta $MAIL_USER/cur"
	rm -f $MAIL_USER/cur/*
done


#todo: vc poderia obter a lista de usuários de forma automática.
#mas eu prefiro assim pois fica mais claro o que está sendo feito.