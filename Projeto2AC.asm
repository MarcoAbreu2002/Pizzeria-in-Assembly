;Valores constantes
pequena        	   		EQU     5   ;Pre�o de uma pizza pequena
grande         	   		EQU     9   ;Pre�o de uma pizza grande
valorParaDesconto  		EQU    50   ;Valor necess�rio gastar para obter o desconto
desconto           		EQU    50   ;Percentagem de desconto a aplicar numa pizza pequena numa compra igual ou superior a 50 euros
EnderecoPequena    		EQU	10E0H 	;endere�o onde se encontra o valor da pizza pequena
EnderecoGrande     		EQU 10E2H 	;endere�o onde se encontra o valor da pizza grande
CaraterVazio       		EQU   20H   ;Carater Vazio
InicioUsernameDisplay   EQU 0040H   ;Inicio do username no display
FimUsernameDisplay      EQU 004FH   ;Fim do username no display
InicioPasswordDisplay	EQU	0060H   ;Inicio da password no display
FimPasswordDisplay      EQU 006FH   ;Fim da password no display
InicioPreco			    EQU 0042H	;In�cio do pre�o no display
FimPreco                EQU 0040H	;Fim do pre�o no display
posi�aoVirgula          EQU 0045H
posi�aoCinco			EQU 0046H
posi�aoZero				EQU 0047H
Nr_TOT_CHAR     		EQU    3	;n� total de carateres a preencher no display
virgula                 EQU   2CH   ;s�mbolo da virgula
cinco                   EQU   35H   ;n�mero cinco

;Perif�ricos entrada

InInicioUsername   EQU   00A0H ;Inicio do Username introduzido pelo utilizador
InFimUsername      EQU   00A8H ;Fim do Username introduzido pelo utilizador
InInicioPassword   EQU   00B0H ;Inicio da Password introduzida pelo utilizador
InFimPassword      EQU   00B8H ;Fim da password introduzida pelo utilizador
BTN_OK         	   EQU   00C0H ;Bot�o de confirma��o
BTN_NR_SEL     	   EQU   00D0H ;Bot�o que escolhe a op��o

;Display
Display      	   EQU   0010H  ;Come�o do display
Display_End    	   EQU   007FH  ;Fim do display
 
;Endere�os na base de dados
Inicio_BD     	   EQU   1000H  ;Come�o da base de dados
InicioUsername     EQU	 0000H  ;dist�ncia relativamente ao inicio da DB para ler o username
FimUsername        EQU   0007H	;dist�ncia relativamente ao fim da DB para ler o username
InicioPassword     EQU   0010H  ;dist�ncia relativamente ao inicio da DB para ler a password
FimPassword        EQU   0018H	;dist�ncia relativamente ao fim da DB para ler a password
saldo_acumulado    EQU   0000H  ;dist�ncia relativamente ao inicio da DB para ler o saldo_acumulado at� o momento
proximo            EQU     30H  ;salto para o proximo cliente da DB
tamanho            EQU   1200H 	;fim da DB

StackPointer       EQU   8000H  ;endere�o da pilha


;****************************************************************************************************************
;*											DISPLAYS														    *
;****************************************************************************************************************
PLACE 2000H
Display_main:
	String "      Main      "
	String "                " ;Display Inicial do programa
	String "1)login         "
	String "                "
	String "2)Criar Conta   "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2080H
Display_Criar_Conta:
	String "   Criar Conta  "
	String "                "
	String " INTRODUZA NOME " ;Display Criar Conta
	String "                "
	String " INTRODUZA PASS "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2100H
Display_Criar_Conta_Sucesso:
	String "   Cria��o de   "	;Display Criar Conta com sucesso
	String "     conta      "	
	String "   EXECUTADA    "
	String "      COM       "
	String "    SUCESSO!    "
	String "                "
	String " OK - CONTINUAR "

PLACE 2180H
Display_Erro_campos_em_falta:
	String "    ATEN��O!    " ;Display erro na cria��o de conta, campos em falta
	String "                "
	String " Todos os campos"
	String "   devem ser    "
	String "  preenchidos   "
	String "                "
	String " OK - CONTINUAR "

PLACE 2200H
Display_Erro_pass_curta:
	String "    ATEN��O!    " ;Display erro na cria��o de conta, password curta
	String " A sua password "
	String "  deve ter no   "
	String "     m�nimo     "
	String "  3 carateres   "
	String "                "
	String " OK - CONTINUAR "	
	
	
PLACE 2280H
Display_Login:
	String "   VERIFICA��O  "	;Display para introdu��o dos dados do utilizador
	String "                "
	String " INTRODUZA NOME "
	String "                "
	String " INTRODUZA PASS "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2300H
Display_Verificao_Sucesso:
	String "                "	;Display Verifica��o utilizador com sucesso
	String "   VERIFICA��O  "	
	String "   EXECUTADA    "
	String "      COM       "
	String "    SUCESSO!    "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2380H
Display_Home:
	String "      Home      "
	String "                " 	;Display principal da pizzaria
	String "1)Fazer pedido  "
	String "                "
	String "2)logout        "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2400H
Display_Verificao_Insucesso:
	String "   VERIFICA��O  "	;Display Verifica��o utilizador com insucesso
	String "    FALHADA!    "
	String "                "
	String "    VERIFIQUE   "
	String "   CREDENCIAIS  "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2480H
Display_Menu:
    String "Escolha a pizza:"   ;Display Menu
	String "1) Vegetariana  "
	String "2) Caprichosa   "
	String "3) Amalfi       "
	String "4) Margarita    "
	String "5) Pesto        "
	String " OK - CONTINUAR "
	
PLACE 2500H
Display_Tamanho_Pizza:
    String " Tamanho pizza: "   ;Display Tamanho da pizza
	String "                "
	String "1)Grande        "
	String "                "
	String "2)Pequena       "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2580H
Display_Desconto:
    String "   Desconto!    "   ;Display Desconto
	String "  A sua pizza   "
	String "   de menor     "
	String "  valor ter�    "
	String "50 % de desconto"
	String "                "
	String " OK - CONTINUAR "
		
PLACE 2600H
Display_Pagamento:
	String "   Pagamento    "
	String "                " ;Display de pagamento
	String " Valor a pagar: "
	String "          euros "
	String "                "
	String "                " 
	String " OK - CONTINUAR "
	
PLACE 2680H
Display_Pagamento_Desconto:
	String "   Pagamento    " ;Display de pagamento com desconto
    String "  Valor a pagar "
	String "  com desconto: "
	String "           euros"
	String "                "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2700H
Display_Compra_finalizada:
    String "    Sucesso!    "   ;Display Pedido finalizado
	String "                "
	String "  O seu pedido  "
	String " foi processado "
	String "  com sucesso   "
	String "                "
	String " OK - CONTINUAR "
	
PLACE 2780H
Display_Opcao_Invalida:
	String "     ATEN��O!   "   ;Display opcaoInvalida
	String "                "
	String "      Op��o     "
	String "    escolhida   "
	String "    Inv�lida!   "
	String "                "
	String " OK - CONTINUAR "

PLACE 2800H
Display_finalizar_pedido:
	String "Deseja adicionar"   ;Display finalizar pedido
	String "  mais alguma   "
	String "     coisa?     "
	String "1) N�o          "
	String "2) Pizza        "
	String "3) Bebida       "
	String " OK - CONTINUAR "
	
PLACE 2880H
Display_Username_existente:
	String "   O username   "   ;Display erro por j� existir username na base de dados
	String "  inserido j�   "
	String "    existe      "
	String "   Insira um    "
	String "   diferente    "
	String "                "
	String " OK - CONTINUAR "

PLACE 2900H
Display_Menu_bebidas:
	String "Menu de bebidas "   ;Display menu das bebidas
	String "1) Nenhuma      "
	String "2) �gua(1$)     "
	String "3) Ice Tea(2$)  "
	String "4) Coca-Cola(2$)"
	String "5) Fanta (2$)   "
	String " OK - CONTINUAR "


;****************************************************************************************************************
;*                                                Iniciar                                                       *
;****************************************************************************************************************
PLACE 0000H
Inicio:
	
	MOV R0, Principio				  ;coloca o endere�o do Principio em R0
	JMP R0							  ;Salta para a rotina do Principio
	
;****************************************************************************************************************
;*                                                Principio                                                     *
;****************************************************************************************************************

PLACE 6000H

Principio:
    MOV SP, StackPointer              ;inicializa o StackPointer colocando em SP o endere�o do inicio da pilha	
	CALL LimpaDisplay				  ;Chama a rotina para limpar o display,ou seja, colocar o display a branco
	CALL LimpaButoes				  ;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL e BTN_OK) a 0
	CALL LimpaPeriferiosUserPass	  ;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0


Liga:
	CAll Verifica_OK                  ;Verifica se o bot�o OK est� a 1
	JNE Liga						  ;Se n�o tiver volta � rotina Liga
		
Ligado:
	MOV R2, Display_main			  ;Coloca em R2 o display inicial do programa
	CALL MostraDisplay				  ;Atualiza o display para o display em endere�o 
	CALL LimpaButoes                  ;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass	  ;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	
Le_Opcao_main:
	MOV R0, BTN_NR_SEL				  ;Coloca em R0 o valor da op��o escolhida pelo cliente
	MOVB R1, [R0]					  ;Coloca o valor de R0 bit a bit em R1 
	CMP R1, 0						  ;Compara o valor de R1 com 0
	JEQ Le_Opcao_main				  ;Se R1 for 0, salta para a rotina Le_Opcao_main
	CMP R1, 1                         ;Compara a op�ao escolhida com 1
	JEQ login						  ;Se for 1, a op�ao escolhida foi login e o utilizador � redirecionado para o login
	CMP R1, 2						  ;Compra a op�ao escolhida com 2
	JEQ auxCriarConta                 ;Se for 2, a op�ao escolhida foi criar conta redirecionando o utilizador para a cria��o da mesma
	CALL RotinaErro					  ;Se nenhuma das compara��es for um sucesso o programa ir� passar para a rotina erro
	JMP Ligado			      		  ;se a op��o n�o for nem 1 nem 2, a op��o escolhida � inv�lida
   
RotinaErro:
	PUSH R2							  ;---------------------------------------------------
	PUSH R0							  ;- Introduz dentro da pilha os registos utilizados -
	PUSH R1							  ;---------------------------------------------------
	MOV R2, Display_Opcao_Invalida    ;Coloca em R2 o display de op��o inv�lida
	CALL MostraDisplay				  ;Atualiza o display para o display em endere�o
	CALL LimpaButoes				  ;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass      ;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	MOV R0, BTN_OK					  ;Coloca em R0 o valor do bot�o ok
	
ERRO:
	MOVB R1, [R0]					  ;Coloca o valor de R0 bit a bit em R1
	CMP R1, 1						  ;Compara R1 com 1
	JNE ERRO						  ;Se o valor de R1 n�o for 1, salta para a rotina ERRO fazendo um ciclo
	POP R1							  ;----------------------------------------------------------
	POP R0							  ;- Remove os registos usados na rotina de dentro da pilha -
	POP R3							  ;----------------------------------------------------------
	RET								  ;retorna a rotina

;******************************************************************************************************************
;* 											Rotina respons�vel pelo login do utilizador							  *
;******************************************************************************************************************

login:
	MOV R2, Display_Login	          ;Coloca em R2 o endere�o do display de login
	CALL MostraDisplay				  ;Atualiza o display para o display em endere�o
	CALL LimpaButoes				  ;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass	  ;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0

ciclo_login:
	MOV R3, InInicioUsername          ;Coloca em R3 o endere�o do username introduzido
	MOV R4, InInicioPassword          ;Coloca em R4 o endere�o da password introduzida
	MOV R0, [R3]					  ;Coloca em R0 o valor do username	
	MOV R1, [R4]					  ;Coloca em R1 o valor da password
	CMP R0, 0 						  ;Compara o valor introduzido para o username com 0
	JEQ ciclo_login		  			  ;Se o nome introduzido =0 volta ao inicio do ciclo	
	CMP R1, 0                         ;Compara R1 com 0
	JEQ ciclo_login       	  		  ;se a compara�ao for =0 volta ao inicio do ciclo	
	CALL Verifica_OK				  ;Chama a rotina respons�vel por verificar o bot�o ok
	
verificacao_login_Username:
	PUSH R0             			  ;---------------------------------------------------                                
    PUSH R1                           ;-                  								 -
    PUSH R2                           ;-                 								 -
    PUSH R3                           ;-                 								 -
    PUSH R4                           ;- Introduz dentro da pilha os registos utilizados -                 
    PUSH R5                           ;-                								 -
    PUSH R6                           ;-                								 -
    PUSH R7                           ;-                								 -
    PUSH R8							  ;-												 -
	PUSH R9							  ;---------------------------------------------------
	MOV R0, Inicio_BD				  ;Coloca em R0 o endere�o de onde come�a a base de dados
	MOV R1, InInicioUsername		  ;Coloca em R1 o endere�o de onde come�a o username escrito
	MOV R2, InFimUsername			  ;Coloca em R2 o endere�o de onde acaba o username escrito
	MOV R3, InicioUsername			  ;Coloca em R3 o endere�o de onde come�a o username na base de dados
	MOV R4, FimUsername				  ;Coloca em R4 o endere�o de onde acaba o username na base de dados
	MOV R9, proximo					  ;Coloca em R9 o valor do salto para o proximo cliente na base de dados
	
ciclo_verifica_UserName:
	MOV R5, R0						  ;Coloca o endere�o de R0(inicio base de dados) em R5
	MOV R7, R3						  ;Coloca o endere�o de R3(inicio do username na base de dados) em R7
	ADD R5, R7						  ;Adiciona o endere�o em R7 ao endere�o em R5
	MOVB R8, [R5]					  ;Coloca o valor de R5(valor que se encontra no inicio da base de dados ) em R8
	CMP R5, 0 						  ;Compara R5 com 0
	JEQ verificacao_insucesso		  ;Se R5 � igual a 0 quer dizer que a base de dados est� vazia, salta para a rotina verifica_insucesso
	CMP R1, R2						  ;Compara R1(inicio do username introduzido) com R2(fim do username introduzido)
	JEQ verifica_password			  ;Se R2 for igual a R1 (chegou ao fim do username introduzido logo existe um igual na base de dados), salta para a rotina verifica_password
	MOVB R6, [R1]					  ;Coloca o valor de R1(primeiro bit do username introduzido)em R6
	CMP R6, R8						  ;Compara R8 com R6
	JEQ proximoCaraterUsername		  ;Se R8 for igual a R6 quer dizer que o valor do input � igual ao da base de dados logo passa para o proximo carater, salta para a rotina proximoCaraterUsername
	CMP R6, R8						  ;Compara R8 com R6
	JNE ProximoClienteNaDB			  ;Se R6 for diferente de R8, salta para a rotina ProximoClienteNaDB
	
proximoCaraterUsername:
	ADD R3, 1						  ;Adiciona 1 no endere�o de R3 -> proximo carater na base de dados
	ADD R1, 1						  ;Adiciona 1 no endere�o de R1 -> proximo carater do input
	JMP ciclo_verifica_UserName		  ;Salta para rotina ciclo_verifica_UserName

ProximoClienteNaDB:
	ADD R0, R9						  ;Adiciona ao endere�o de R0 o endere�o de R9 -> R0 passa a conter o endere�o do username do utilizador seguinte, uma vez que todos os utilizadores distam uns dos outros(por username) por 30H
	JMP ciclo_verifica_UserName		  ;Salta para a rotina ciclo_verifica_UserName

verifica_password:
	MOV R1, InInicioPassword		  ;Coloca em R1 o endere�o de onde come�a a password introduzida pelo cliente
	MOV R2, InFimPassword			  ;Coloca em R2 o endere�o de onde acaba a password introduzida pelo cliente
	MOV R3, InicioPassword			  ;Coloca em R3 o endere�o de onde come�a a password na base de dados
	MOV R4, FimPassword				  ;Coloca em R4 o endere�o de onde acaba a password na base de dados

ciclo_verifica_password:
	MOV R5, R0						  ;Coloca o endere�o de R0(inicio BD) em R5
	MOV R7, R3					      ;Coloca o endere�o de R3(inicio password base dados) em R7
	ADD R5, R7						  ;Adiciona o endere�o de R7 ao endere�o de R5 -> logo R5 passa a ter o valor da password da base de dados
	MOVB R8, [R5]					  ;Coloca o valor de R5(password da DB) em R8
	CMP R5, 0 						  ;Compara R5 com 0
	JEQ verificacao_insucesso		  ;Se R5 � igual a 0, salta para a rotina verificacao_insucesso
	CMP R1, R2						  ;Compara R2 com R1
	JEQ verificacao_sucesso			  ;Se R2 � igual a R1, salta para a rotina verificacao_insucesso
	MOVB R6, [R1]					  ;Coloca o valor de R1 bit a bit em R6
	CMP R6, R8						  ;Compara R8 com R6
	JEQ proximoCaraterPassword		  ;Se R6 � igual a R8, salta para a rotina proximoCaraterPassword
	JNE verificacao_insucesso		  ;Se R6 � diferente a R8, salta para a rotina verifica_insucesso
	JMP ProximoClienteNaDB			  ;Salta para a rotina ProximoClienteNaDB

proximoCaraterPassword:
	ADD R1, 1					   	  ;Adiciona 1 ao endere�o de R1
	ADD R3, 1						  ;Adiciona 1 ao endere�o de R3
	JMP ciclo_verifica_password		  ;Salta para a rotina ciclo_verifica_password
	
verificacao_insucesso:
	CALL colocaNoDisplay				;Chama a rotina colocaNoDisplay respons�vel por colocar no display o username e password introduzidas pelo cliente
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R2, Display_Verificao_Insucesso ;Coloca em R2 o display Display_Verificao_Insucesso
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	;CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP Ligado							;Salta para a rotina login
	
verificacao_sucesso:
	CALL colocaNoDisplay				;Chama a rotina colocaNoDisplay respons�vel por colocar no display o username e password introduzidas pelo cliente
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R2, Display_Verificao_Sucesso	;Coloca em R2 o display Display_Verificao_Sucesso
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	;CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	;CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP FimLogin						;Salta para a rotina FimLogin
	
auxCriarConta:
	JMP criarConta						;Salta para a rotina criarConta

FimLogin:
	MOV R8, 8							;Coloca 8 no endere�o de R8	
	MOV R9, R5							;Coloca o endere�o R5 em R9
	ADD R9, R8							;Adiciona ao endere�o R9 o endere�o R8
	MOV R10, R9							;Coloca em R10 o endere�o de R9
	POP R9								;----------------------------------------------------
    POP R8                              ;-               									-
    POP R7                              ;-              									-
    POP R6                              ;-              									-
    POP R5                              ;- Remove de dentro da pilha os registos utilizados -             
    POP R4                              ;-           										-
    POP R3                              ;-              									-
    POP R2                              ;-              									-
    POP R1                              ;-             										-
    POP R0                              ;----------------------------------------------------     
	
auxChamaPedido:
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP Fazer_Pedido					;Salta para a rotina Fazer_Pedido

;******************************************************************************************************************
;*                               		Coloca os dados inseridos no display									  *	
;******************************************************************************************************************
colocaNoDisplay:
	PUSH R0 							;---------------------------------------------------                                           
    PUSH R1                             ;-              								   -
    PUSH R2                             ;-              								   -
    PUSH R3                             ;- Introduz dentro da pilha os registos utilizados -            
    PUSH R4                             ;-               								   -
    PUSH R5                             ;-              								   -
    PUSH R6                             ;---------------------------------------------------
	MOV R0, InInicioUsername			;Coloca em R0 o endere�o do inicio do username introduzido pelo cliente
	MOV R1, InInicioPassword			;Coloca em R1 o endere�o do inicio da password introduzida pelo cliente
	MOV R2, 2AH							;Coloca em R2 o endere�o do carater *
	MOV R3, InicioUsernameDisplay		;Coloca em R3 o endere�o do inicio do username no display
	MOV R4, FimUsernameDisplay			;Coloca em R4 o endere�o do fim do username no display
	MOV R5, InicioPasswordDisplay		;Coloca em R5 o endere�o do inicio da password no display
	MOV R6, FimPasswordDisplay			;Coloca em R6 o endere�o do fim da password no display

cicloColocaUsername:
	MOVB R7, [R0]						;Coloca o valor de R0(username introduzido, primeiro carater ) em R7
	CMP R7, 0 							;Compara R7 com 0 
	JEQ cicloColocaPass					;Se R7 for igual a 0 -> ja percorreu todo o username , salta para a rotina cicloColocaPass
	MOVB [R3], R7						;Coloca o endere�o de R7 bit a bit no valor de R3
	CMP R3, R4							;Compara R3 com R4 
	JEQ cicloColocaPass					;Se R3 for igual a R4 -> chegou ao fim do username, salta para a rotina cicloColocaPass
	ADD R0, 1							;Adiciona 1 no endere�o de R0 -> proximo carater
	ADD R3, 1							;Adiciona 1 no endere�o de R3 -> proximo carater
	JMP cicloColocaUsername				;Salta para a rotina cicloColocaPass
	
cicloColocaPass:
	MOVB R7, [R1]						;Coloca o valor de R1 bit a bit em R7
	CMP R7, 0 							;Compara R7 com 0
	JEQ FimColoca						;Se R7 for igual a 0 -> ja percorreu toda a password, salta para a rotina FimColoca
	MOVB [R5], R2						;Coloca o endere�o de R2 bit a bit no valor de R5
	CMP R3, R4							;Compara R3 com R4
	JEQ FimColoca						;Se R3 for igual a R4-> chegou ao fim da password, salta para a rotina FimColoca
	ADD R1, 1							;Adiciona 1 no endere�o R1 -> proximo carater
	ADD R5, 1							;Adiciona 1 no endere�o R5 -> proximo carater
	JMP cicloColocaPass					;Salta para a rotina cicloColocaPass
	
FimColoca:
	POP R6								;----------------------------------------------------								
	POP R5								;-													-
	POP R4								;- 													-
	POP R3								;- Remove de dentro da pilha os registos utilizados -	
	POP R2								;-													-
	POP R1								;-													-
	POP R0								;----------------------------------------------------	
	RET									;Retorna a rotina

;******************************************************************************************************************
;*                               Rotina Respons�vel pela cria��o de uma conta									  *	
;******************************************************************************************************************

criarConta:
	MOV R2, Display_Criar_Conta		  	;Coloca em R2 o endere�o do display de criar conta
	CALL MostraDisplay				  	;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R0, InInicioUsername			;Coloca em R0 o endere�o do inicio do username introduzido pelo cliente
	MOV R1, InFimUsername				;Coloca em R1 o endere�o do fim do username introduzido pelo cliente
	MOV R2, InInicioPassword			;Coloca em R2 o endere�o do inicio da password introduzida pelo cliente
	MOV R3, InFimPassword 				;Coloca em R3 o endere�o do fim da password introduzida pelo cliente
	MOVB R4, [R0]						;Coloca o valor de R0(inicio do username introduzido) bit a bit em R4
	MOVB R5, [R1]						;Coloca o valor de R1(fim do username introduzido) bit a bit em R5
	MOV R8, 3							;Coloca 3 no endere�o de R8 -> tamanho minimo da password
	MOV R9, 0							;Coloca 0 no endere�o de R9 -> contador para a password
		
cicloVerificaPass:
	MOVB R6, [R2]						;Coloca o valor de R2(inicio valor introduzido password) bit a bit em R6
	MOVB R7, [R3]						;Coloca o valor de R3(fim valor introduzido password) bit a bit em R7
	CMP R6, R7							;Compara R6 com R7
	JEQ cicloVerificaTamanhoPass		;Se R6 � igual a R7(chegou ao fim da verificacao ou seja ja iterou sobre todos os carateres), salta para rotina cicloVerificaTamanhoPass
	ADD R2, 1							;Adiciona 1 no endere�o R2 -> proximo carater da pass
	ADD R9,1							;Adiciona 1 no endere�o R9 -> aumenta contador -> mais 1 carater encontrado na password
	JMP cicloVerificaPass				;Salta para a rotina cicloVerificaPass
	
cicloVerificaTamanhoPass:
	PUSH R9								;Coloca dentro da pilha os registos a utilizar
	PUSH R8								;Coloca dentro da pilha os registos a utilizar
	CMP R9, R8							;Compara R9 com R8
	JLT Display_pass_Curta				;Se R8 for menor que R9(se tamanho de password for inferior a 3), salta para a rotina Display_pass_Curta
	CALL cicloVerificaUser				;Chama para a rotina cicloVerificaUser respons�vel por verificar o cliente na base de dados
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	
cicloVerificaUser:
	CMP R4, 0							;Compara R4 com 0 -
	JEQ Display_campos_em_falta			;Se R4 for igual a 0 -> nao foi introduzido username, salta para a rotina Display_campos_em_falta
	JNE VerificaUserNaDB				;Se R4 for diferente que 0, salta para a rotina VerificaUserNaDB

VerificaUserNaDB:
	MOV R2, Inicio_BD					;Coloca em R2 o endere�o do inicio da base de dados
	MOV R3, InicioUsername				;Coloca em R3 o endere�o do inicio do username na base de dados
	MOV R4, FimUsername					;Coloca em R4 o endere�o do fim do username na base de dados
	MOV R9, proximo						;Coloca em R9 o endere�o para passar para o proximo cliente na base de dados
	MOV R7, tamanho						;Coloca em R7 o n� de clientes na base de dados
	
cicloVerificaUserNaDB:
	CMP R0, R1 							;Compara R0(inicio username introduzido) com R1(fim username introduzido)
	JGT Inserir_conta_na_DB				;Se R0 for maior que R1(percorreu todos os carateres e todos coincidiram), salta para a rotina Inserir_conta_na_DB
	MOVB R6,[R0]						;Coloca o valor de R0(username introduzido) bit a bit em R6
	MOVB R8, [R2]						;Coloca o valor de R2(valor no inicio da base de dados) bit a bit em R8
	CMP R6, 0							;Compara R6 com 0
	JEQ usernameExistente				;Se R6 � igual a 0(quer dizer que percorreu completamente o username introduzido), salta para a rotina usernameExistente
	CMP R6, R8							;Compara R6 com R8
	JEQ proximoCarater					;Se R6 � igual a R8(carater introduzido igual ao da base de dados), salta para a rotina proximoCarater
	JNE ProximoCliente					;Se R8 � menor que R6(se nao for igual passa ao proximo cliente), salta para a rotina ProximoCliente
	CMP R8, R7							;Compara R8 com R7
	JGT Inserir_conta_na_DB				;Se R7 � maior que R8(chegou ao fim da base de dados e nao encontrou um match), salta para a rotina Inserir_conta_na_DB
	JMP ProximoCliente					;Salta para a rotina ProximoCliente
	
proximoCarater:
	ADD R2, 1							;Adiciona 1 no endere�o R2
	ADD R0, 1							;Adiciona 1 no endere�o R0
	JMP cicloVerificaUserNaDB			;Salta para a rotina cicloVerificaUserNaDB

ProximoCliente:
	ADD R0, R9							;Adiciona o endere�o de R9 ao endere�o R0
	JMP cicloVerificaUserNaDB			;Salta para a rotina cicloVerificaUserNaDB
	
usernameExistente:
	CALL colocaNoDisplay				;Chama a rotina colocaNoDisplay respons�vel por colocar no display o username e password introduzidas pelo cliente
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R2, Display_Username_existente	;Coloca R2 o display Display_Username_existente
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP criarConta						;Salta para a rotina criarConta
	
Display_pass_Curta:
	CALL colocaNoDisplay				;Chama a rotina colocaNoDisplay respons�vel por colocar no display o username e password introduzidas pelo cliente
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R2, Display_Erro_pass_curta		;Coloca em R2 o display Display_Erro_pass_curta
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP criarConta						;Salta para a rotina criarConta
	
Display_campos_em_falta:
	CALL colocaNoDisplay				;Chama a rotina colocaNoDisplay respons�vel por colocar no display o username e password introduzidas pelo cliente
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R2, Display_Erro_campos_em_falta;Coloca em R2 o display Display_Erro_campos_em_falta
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP criarConta						;Salta para a rotina criarConta
	
;******************************************************************************************************************	
;*  									Rotina respons�vel pela inser��o do novo utilizador na DB				  *
;******************************************************************************************************************

Inserir_conta_na_DB:
    PUSH R0  							;-------------------------------------------------                                          
    PUSH R1                             ;-               								 -
    PUSH R2                             ;-              								 -
    PUSH R3                             ;-               								 -
    PUSH R4                             ;- Coloca dentro da pilha os registos a utilizar -                
    PUSH R5                             ;-               								 -
    PUSH R6                             ;-               								 -
    PUSH R7                             ;-               								 -
    PUSH R8								;-------------------------------------------------
	MOV R0, Inicio_BD					;Coloca em R0 o endere�o do inicio da base de dados
	MOV R1, proximo						;Coloca em R1 o endere�o do proximo cliente na base de dados
	MOV R2, InInicioUsername			;Coloca em R2 o endere�o do inicio do username introduzido pelo cliente
	MOV R3, InFimUsername				;Coloca em R3 o endere�o do fim do username introduzido pelo cliente
	MOV R4, InInicioPassword			;Coloca em R4 o endere�o do inicio da password introduzida pelo cliente
	MOV R5, InFimPassword				;Coloca em R5 o endere�o do fim da password introduzida pelo cliente
	MOV R10, 0							;Coloca em R10 o valor 0
	
ciclo_escritaDB:
	MOV R8, R0							;Coloca o endere�o de R0(inico BD) em R8
	MOVB R7, [R0]						;Coloca o valor de R0(carateres das informa�oes da BD) bit a bit em R7
	CMP R7, 0							;Compara R7 com 0
	JEQ EscreveUserNaDB					;Se R7 � igual a 0(espa�o vazio na base de dados logo pode ser escrito sem sobrepor nenhum valor), salta para a rotina EscreveUserNaDB
	ADD R0, R1							;Adiciona o endere�o de R1 no endere�o de R0(passa ao proximo cliente com intuito de procurar um espa�o vazio)
	JMP ciclo_escritaDB					;Salta para a rotina ciclo_escritaDB

EscreveUserNaDB:
	MOVB R7, [R2]						;Coloca o valor de R2(inicio username introduzido) bit a bit em R7
	CMP R7, 0							;Compara R7 com 0
	JEQ Fim_de_escrita					;Se R7 � igual a 0(ja percorreu todo o username), salta para a rotina Fim_de_escrita
	MOVB [R0], R7						;Coloca o endere�o R7 no valor de R0 bit a bit -> coloca em R7 ou seja a posi�ao da BD o username introduzido
	CMP R2, R3							;Compara R2 com R3 -> verifica se ja chegou ao fim do username introduzido
	JEQ Fim_de_escrita					;Se R2 � igual a R3, salta para a rotina Fim_de_escrita
	ADD R2, 1							;Adiciona 1 no endere�o de R2
	ADD R0, 1							;Adiciona 1 no endere�o de R0
	JMP EscreveUserNaDB					;Salta para a rotina EscreveUserNaDB

Fim_de_escrita:							;											 --------------------------------------------------------
	MOV R6, 10H							;Coloca o endere�o 10H no R6				 -- Objetivo de passar � linha seguinte na base de dados 
	ADD R8, R6							;Adiciona o endere�o de R6 ao endere�o de R8 --
	MOV R0, R8							;Coloca R8 em R0							 -------------------------------------------------------

EscrevePassNaDB:
	MOVB R7, [R4]						;Coloca o valor de R4(inicio password introduzida) bit a bit em R7
	CMP R7, 0							;Compara R7 com 0
	JEQ sucessoCriacao					;Se R7 � igual a 0(percorreu a password completamente), salta para a rotina sucessoCriacao
	MOVB [R0], R7						;Coloca o endere�o de R7(carater da password) no valor de R0 bit a bit
	CMP R4, R5							;Compara R4 com R5
	JEQ sucessoCriacao					;Se R4 � igual a R5 -> iterou completamente sobre a password introduzida, salta para a rotina sucessoCriacao
	ADD R4, 1							;Adiciona 1 ao endere�o de R4
	ADD R0, 1							;Adiciona 1 ao endere�o de R4
	JMP EscrevePassNaDB					;Salta para a rotina EscrevePassNaDB fazendo um ciclo
	

sucessoCriacao:
	CALL colocaNoDisplay				;Chama a rotina colocaNoDisplay respons�vel por colocar no display o username e password introduzidas pelo cliente
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	MOV R2, Display_Criar_Conta_Sucesso ;Coloca em R2 o display Display_Criar_Conta_Sucesso
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	;JMP Fim								;Salta para a rotina Fim
	
Fim:
	MOV R10, R8							;Coloca o endere�o de R8 em R10
	POP R8								;----------------------------------------------------
	POP R7								;-													-
	POP R6								;-													-
	POP R5								;-													-
	POP R4								;- Remove de dentro da pilha os registos utilizados -
	POP R3								;-													-
	POP R2								;-													-
	POP R1								;-													-
	POP R0								;----------------------------------------------------
	JMP Ligado
	
auxChamaLigado:							;Utilizado por erros de fora de alcance
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP Ligado							;Salta para a rotina Ligado


;******************************************************************************************************************
;*								Rotina respons�vel pelo processo do pedido do cliente							  *
;******************************************************************************************************************
		
Fazer_Pedido:
	MOV R2, Display_Home				;Coloca em R2 o display Display_Home
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
			
Le_Opcao_Pedido:
	MOV R0, BTN_NR_SEL					;Coloca em R0 o valor de escolha do bot�o de sele��o
	MOVB R1, [R0]						;Coloca o valor de R0 bit a bit em R1
	CMP R1, 0							;Compara R1 com 0
	JEQ Le_Opcao_Pedido					;Se R1 � igual a 0, salta para a rotina Le_Opcao_Pedido
	CMP R1, 1                         	;Compara R1 com 1
	JEQ rotinaPedido					;Se for 1, a op�ao escolhida foi login e o utilizador � redirecionado para o login
	CMP R1, 2						  	;Compra a op�ao escolhida com 2
	JEQ auxChamaLigado                  ;Se for 2, a op�ao escolhida foi criar conta redirecionando o utilizador para a cria��o da mesma
	CALL RotinaErroPedido				;Se nenhuma das compara��es for um sucesso o programa ir� passar para a rotina erro do pedido
	JMP Le_Opcao_Pedido			        ;se a op��o n�o for nem 1 nem 2, a op��o escolhida � inv�lida
   
RotinaErroPedido:
	PUSH R2								;-------------------------------------------------
	PUSH R0								;- Coloca dentro da pilha os registos a utilizar -
	PUSH R1								;-------------------------------------------------
	MOV R2, Display_Opcao_Invalida		;Coloca em R2 o display Display_Opcao_Invalida
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	MOV R0, BTN_OK						;Coloca o valor do bot�o ok em R0
	
ErroPedido:
	MOVB R1, [R0]						;Coloca o valor de R0 bit a bit em R1		
	CMP R1, 1							;Compara R1 com 1
	JNE ErroPedido						;Se R1 � diferente de 1, salta para a rotina ErroPedido
	POP R1								;----------------------------------------------------
	POP R0								;- Remove de dentro da pilha os registos utilizados -
	POP R3								;----------------------------------------------------
	RET									;Retorna a rotina

rotinaPedido:
	MOV R2, Display_Menu				;Coloca em R2 o display Display_Menu
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok

escolher_pizza:
	MOV R0, BTN_NR_SEL					;Coloca em R0 o valor de escolha do bot�o de sele��o
	MOVB R1, [R0]						;Coloca o valor de R0 bit a bit em R1
	CMP R1, 0							;Compara R1 com 0
	JEQ escolher_pizza					;Se R1 for igual a 0, salta para a rotina escolher_pizza
	CMP R1, 1							;Compara R1 com 1
	JEQ tamanho_Pizza					;Se R1 for igual a 1, salta para a rotina tamanho_Pizza
	CMP R1, 2							;Compara R1 com 2
	JEQ tamanho_Pizza					;Se R1 for igual a 2, salta para a rotina tamanho_Pizza
	CMP R1, 3							;Compara R1 com 3
	JEQ tamanho_Pizza					;Se R1 for igual a 3, salta para a rotina tamanho_Pizza
	CMP R1, 4							;Compara R1 com 4
	JEQ tamanho_Pizza					;Se R1 for igual a 4, salta para a rotina tamanho_Pizza
	CMP R1, 5							;Compara R1 com 5
	JEQ tamanho_Pizza					;Se R1 for igual a 5, salta para a rotina tamanho_Pizza
	MOV R2, Display_Opcao_Invalida		;Coloca em R2 o display Display_Opcao_Invalida
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP rotinaPedido					;Salta para a rotina rotinaPedido

tamanho_Pizza:
	MOV R2, Display_Tamanho_Pizza		;Coloca em R2 o display Display_Tamanho_Pizza
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	
escolher_tamanho:
	MOV R0, BTN_NR_SEL					;Coloca em R0 o valor de escolha do bot�o de sele��o
	MOVB R1, [R0]						;Coloca o valor de R0 bit a bit em R1
	CMP R1, 0							;Compara R1 com 0
	JEQ escolher_tamanho				;Se R1 for igual a 0, salta para a rotina escolher_tamanho
	CMP R1, 1							;Compara R1 com 1
	JEQ adicionaPrecoConta				;Se R1 for igual a 1, salta para a rotina adicionaPrecoConta
	CMP R1, 2							;Compara R1 com 2
	JEQ adicionaPrecoConta				;Se R1 for igual a 2, salta para a rotina adicionaPrecoConta
	MOV R2, Display_Opcao_Invalida		;Coloca em R2 o display Display_Opcao_Invalida
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP tamanho_Pizza					;Salta para a rotina tamanho_Pizza

	
adicionaPrecoConta:
	PUSH R1   							;-------------------------------------------------
	PUSH R2                             ;-              								 -
    PUSH R3                             ;- Coloca dentro da pilha os registos a utilizar -              
    PUSH R4                             ;-               								 - 
    PUSH R5 							;-------------------------------------------------
	MOV R0, R10							;Coloca o endere�o de R10 em R1
	MOV R9, R10
	ADD R9, 5
	MOV R2, grande						;Coloca o valor da pizza grande em R2
	MOV R3, pequena						;Coloca o valor da pizza pequena em R3
	CMP R1, 1							;Compara R1 com 1
	JEQ pizzaGrande						;Se R1 for igual a 1, salta para a rotina pizzaGrande
	CMP R1, 2							;Compara R1 com 2
	JEQ pizzaPequena					;Se R1 for igual a 2, salta para a rotina pizzaPequena
	
pizzaGrande:
	MOVB R5, [R0]						;Coloca o valor de R0 bit a bit em R5 -> R0 tem o endere�o na base de dados correspondente ao saldo acumulado
	ADD R5, R2							;Adiciona o endere�o de R2 no endere�o de R5
	MOVB [R0], R5						;Coloca o endere�o de R5 no valor de R0 bit a bit
	MOVB R6, [R9]
	ADD R6, R2
	MOVB [R9], R6
	JMP pedidoSucesso					;Salta para a rotina pedidoSucesso
	
AuxSaltaFazerPedido:
	JMP rotinaPedido					;Salta para a rotina Fazer_Pedido

pizzaPequena:
	MOVB R5, [R0]						;Coloca o valor de R0 bit a bit em R5
	ADD R5, R3							;Adiciona o endere�o de R3 ao endere�o de R5
	MOVB [R0], R5						;Coloca o endere�o de R5 ao valor de R0 bit a bit
	MOVB R6, [R9]						;localiza��o dos valores da pizza na DB
	ADD R6, R3
	MOVB [R9], R6
	JMP pedidoSucesso					;Salta para a rotina pedidoSucesso

pedidoSucesso:
	MOV R2, Display_Compra_finalizada	;Coloca em R2 o display Display_Compra_finalizada
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP FimEscolha						;Salta para a rotina FimEscolha
	
FimEscolha:
	POP R5								;----------------------------------------------------
	POP R4								;-													-
	POP R3 								;- Remove de dentro da pilha os registos utilizados -
	POP R2								;-													-
	POP R1								;-													-
	POP R0								;----------------------------------------------------
	
menubebidas:
	MOV R2, Display_Menu_bebidas
	CALL MostraDisplay
	CALL LimpaPeriferiosUserPass
	CALL LimpaButoes
	PUSH R1   							;-------------------------------------------------
	PUSH R2                             ;-              								 -
    PUSH R3                             ;- Coloca dentro da pilha os registos a utilizar -              
    PUSH R4                             ;-               								 - 
    PUSH R5 							;-------------------------------------------------
	MOV R0, R10							;Coloca o endere�o de R10 em R1 -> localiza��o do valor acumulado  na DB
	MOV R9, R10							
	ADD R9, 7							;Localiza��o do pre�o acumulado da compra ATUAL


menubebidasciclo:
	MOV R4, BTN_NR_SEL					;Coloca em R0 o valor de escolha do bot�o de sele��o
	MOVB R1, [R4]						;Coloca o valor de R0 bit a bit em R1
	CMP R1, 0							;Compara R1 com 0
	JEQ menubebidasciclo
	CMP R1, 2							;Compara R1 com 1
	JEQ compraagua				;Se R1 for igual a 1, salta para a rotina AuxSaltaFazerPedido
	CMP R1, 3							;Compara R1 com 2
	JEQ comprasumo				;Se R1 for igual a 2, salta para a rotina Rotina_pagamento
	CMP R1, 4
	JEQ comprasumo
	CMP R1, 5
	JEQ comprasumo
	CMP R1, 1
	JEQ FinalizarPedido			;Se R1 for igual a 0, salta para a rotina Opcao_Finalizar_Pedido
	CMP R1, 6
	JGE opcaoInvalidaBebida
	
opcaoInvalidaBebida:	
	MOV R2, Display_Opcao_Invalida		;Coloca em R2 o display Display_Opcao_Invalida
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP menubebidas						;Salta para a rotina FinalizarPedido	

compraagua:
	MOV R2, 1							;Pre�o da agua
	MOVB R5, [R0]						;Coloca o valor de R0 bit a bit em R5 -> localiza��o do historico acumulado
	ADD R5, R2							;Adiciona o endere�o de R2 no endere�o de R5
	MOVB [R0], R5						;Coloca o endere�o de R5 no valor de R0 bit a 
	ADD R6, 1							;adiciona o valor da agua
	MOVB [R9], R6
	CALL Verifica_OK
	JMP pedidoSucessobebida				;Salta para a rotina pedidoSucesso
	
comprasumo:
	MOV R2, 2
	MOVB R5, [R0]						;Coloca o valor de R0 bit a bit em R5
	ADD R5, R2							;Adiciona o endere�o de R2 no endere�o de R5
	MOVB [R0], R5						;Coloca o endere�o de R5 no valor de R0 bit a bit
	ADD R6, 2							;adiciona valor do sumo
	MOVB [R9], R6
	CALL Verifica_OK
	JMP pedidoSucessobebida					;Salta para a rotina pedidoSucesso
	
pedidoSucessobebida:
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	MOV R2, Display_Compra_finalizada	;Coloca em R2 o display Display_Compra_finalizada
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP FimEscolhabebida						;Salta para a rotina FimEscolha
	
FimEscolhabebida:
	POP R5								;----------------------------------------------------
	POP R4								;-													-
	POP R3 								;- Remove de dentro da pilha os registos utilizados -
	POP R2								;-													-
	POP R1								;-													-
	POP R0								;----------------------------------------------------	

FinalizarPedido:
	MOV R2, Display_finalizar_pedido	;Coloca em R2 o display Display_finalizar_pedido
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	
Opcao_Finalizar_Pedido:
	MOV R0, BTN_NR_SEL					;Coloca em R0 o valor de escolha do bot�o de sele��o
	MOVB R1, [R0]						;Coloca o valor de R0 bit a bit em R1
	CMP R1, 0
	JEQ Opcao_Finalizar_Pedido
	CMP R1, 1							;Compara R1 com 0
	JEQ Rotina_pagamento			;Se R1 for igual a 0, salta para a rotina Opcao_Finalizar_Pedido
	CMP R1, 2							;Compara R1 com 1
	JEQ AuxSaltaFazerPedido				;Se R1 for igual a 1, salta para a rotina AuxSaltaFazerPedido
	CMP R1, 3							;Compara R1 com 2
	JEQ menubebidas				;Se R1 for igual a 2, salta para a rotina Rotina_pagamento
	MOV R2, Display_Opcao_Invalida		;Coloca em R2 o display Display_Opcao_Invalida
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	JMP FinalizarPedido					;Salta para a rotina FinalizarPedido

Rotina_pagamento:
	CALL verifica_Desconto
	JMP Fazer_Pedido					;Salta para a rotina Fazer_Pedido
	
;******************************************************************************************************************
;*								Rotina respons�vel pelo desconto das pizzas       								  *
;******************************************************************************************************************	
verifica_Desconto:
	PUSH R0
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	PUSH R9
	MOV R0, 9
	MOV R1, 5
	MOV R2, 0
	MOV R3, 50
	SUB R9, 2
	MOVB R8, [R10]				;localiza��o do valor total acumulado da db
	MOVB R6, [R9]

verifica_cinquenta:
	CMP R8, R3					;verifica se o valor � superior a 50euros a verificar se ir� existir desconto
	JLE Converte_to_Char

ciclo_Verifica_pizzas_grandes:
	MOV R4, R6
	MOD R4, R0					;resto de divis�o inteira do valor das pizzas por 9 -> se o resto for igual a 0 quer dizer que s� existem pizzas grandes na ordem caso contr�rio existem pizzas pequenas
	CMP R4, R2
	JEQ desconta_quatro_cinco
	JNE desconta_dois_cinco

desconta_quatro_cinco:
	SUB R6, 5					;Desconto de 4,50 -> � subraido 5 euros aqui pq corresponde ao valor das unidades, posteriormente ser�o adicionados os 50 centimos 
	ADD R9, 2
	MOVB [R9], R6
	CALL Converte_to_Char_desconto
	JMP Fazer_Pedido

desconta_dois_cinco:
	SUB R6, 3
	ADD R9, 2
	MOVB [R9], R6
	CALL Converte_to_Char_desconto
	JMP Fazer_Pedido
	
;******************************************************************************************************************
;*								Rotina respons�vel por converter o pre�o em carateres 							  *
;******************************************************************************************************************	
Converte_to_Char:
	PUSH R0
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	MOV R2, Display_Pagamento			;Coloca em R2 o display Display_Pagamento
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	MOV R0, 10 					;R0 -> valor do divisor
	MOV R2, InicioPreco 		;inicio do display
	ADD R2, 2    				;posi��o do 1� carater a preencher (menos significativo)
	MOV R3, 0    				;R3 tem o o n� total de carateres j� preenchidos
	ADD R9,2
	MOV R8, R9
	MOVB R7, [R8]
	
ProximoCarater:
	MOV R4, R7   				;R4 fica com uma c�pia do valor lido em R10, para obter o resto
	MOD R4, R0 					;R4 fica com o resto da divis�o
	DIV R7, R0
	MOV R5, 48 					;valor em decimal a converter para ASCII
	ADD R4, R5					;obtem o carater em ASCII
	MOV R6, R2 	                ;obt�m endere�o do display
	MOVB [R6], R4               ;coloca o carater no display
	SUB R2, 1                   ;proxima prosicao a preencher
	ADD R3, 1                   ;incrementa o n� de carateres preenchidos
	CMP R3, Nr_TOT_CHAR         ;verifica se j� preencheu todos os carateres, caso contr�rio, prenche vazios
	JEQ Fim_rotina              ;sai da rotina
	;DIV R7, R0                  ;divis�o inteira por 10
	CMP R7, 0
	JNE ProximoCarater          ;se quociente da divis�o por 10 n�o � 0, analisa pr�ximo carater
	
Preenche_vazios:
	MOV R5, CaraterVazio        ;R5 fica com o carater vazio (20H)
	MOV R4, R2                  ;obtem endere�o do display
	MOVB [R4], R5               ;coloca carater vazio no display
	SUB R2, 1                   ;pr�xima posi��o a preencher
	ADD R3, 1                   ;incrementa o n� total de carateres j� preenchidos
	CMP R3, Nr_TOT_CHAR			;verifica se j� preencheu todos os carateres
	JNE Preenche_vazios			
	
Fim_rotina:
	MOV R1, 0
	MOVB [R9], R1
	SUB R9, 2
	MOVB [R9], R1
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R0
	JMP Fazer_Pedido

;******************************************************************************************************************
;*						Rotina respons�vel por converter o pre�o em carateres com desconto						  *
;******************************************************************************************************************	
Converte_to_Char_desconto:
	PUSH R0
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	
	MOV R2, Display_Desconto			;Coloca em R2 o display Display_Pagamento
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL Verifica_OK
	MOV R2, Display_Pagamento_Desconto			;Coloca em R2 o display Display_Pagamento
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	MOV R0, 10 					;R0 -> valor do divisor
	MOV R2, InicioPreco 		;inicio do display
	MOV R4, posi�aoVirgula
	ADD R2, 2    				;posi��o do 1� carater a preencher (menos significativo)
	MOV R3, 0    				;R3 tem o o n� total de carateres j� preenchidos
	MOV R8, R9
	MOVB R7, [R8]
	
virgulaCincoZero:
	MOV R6, virgula
	MOVB [R4], R6
	ADD R4, 1
	MOV R6, cinco
	MOVB [R4], R6
	ADD R4, 1
	MOV R6, 30H
	MOVB [R4],R6

ProximoCaraterDesconto:
	MOV R4, R7   				;R4 fica com uma c�pia do valor lido em R10, para obter o resto
	MOD R4, R0 					;R4 fica com o resto da divis�o
	DIV R7, R0
	MOV R5, 48 					;valor em decimal a converter para ASCII
	ADD R4, R5					;obtem o carater em ASCII
	MOV R6, R2 	                ;obt�m endere�o do display
	MOVB [R6], R4               ;coloca o carater no display
	SUB R2, 1                   ;proxima prosicao a preencher
	ADD R3, 1                   ;incrementa o n� de carateres preenchidos
	CMP R3, Nr_TOT_CHAR         ;verifica se j� preencheu todos os carateres, caso contr�rio, prenche vazios
	JEQ Fim_rotina_desconto     ;sai da rotina
	CMP R7, 0
	JNE ProximoCarater          ;se quociente da divis�o por 10 n�o � 0, analisa pr�ximo carater
	
Preenche_vazios_Desconto:
	MOV R5, CaraterVazio        ;R5 fica com o carater vazio (20H)
	MOV R4, R2                  ;obtem endere�o do display
	MOVB [R4], R5               ;coloca carater vazio no display
	SUB R2, 1                   ;pr�xima posi��o a preencher
	ADD R3, 1                   ;incrementa o n� total de carateres j� preenchidos
	CMP R3, Nr_TOT_CHAR			;verifica se j� preencheu todos os carateres
	JNE Preenche_vazios			
	
Fim_rotina_desconto:
	MOV R1, 0
	MOVB [R9], R1
	SUB R9, 2
	MOVB [R9], R1
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R0
	RET
	
;******************************************************************************************************************
;*												Rotinas de Erro							  					      *
;******************************************************************************************************************

opcaoInvalidaMain:
	MOV R2, Display_Opcao_Invalida	  	;Coloca em R9 o endere�o do display de erro
	CALL MostraDisplay					;Atualiza o display para o display em endere�o
	CALL LimpaButoes					;Chama a rotina para colocar o valor dos butoes(BTN_NR_SEL E BTN_OK) a 0
	CALL LimpaPeriferiosUserPass		;Chama a rotina respons�vel por colocar o valor dos perifericos de entrada (InInicioUsername e InInicioPassword) a 0
	CALL Verifica_OK					;Chama a rotina respons�vel por verificar o bot�o ok
		
;******************************************************************************************************************
;*								Rotina respons�vel pela mudan�a do display		   								  *
;******************************************************************************************************************

MostraDisplay:
	PUSH R0								;-------------------------------------------------
	PUSH R1								;- Coloca dentro da pilha os registos a utilizar -
	PUSH R3								;-------------------------------------------------
	MOV R0, Display						;Coloca em R0 o Display
	MOV R1, Display_End					;Coloca em R1 o fim do Display
ciclo:
	MOV R3, [R2]						;Coloca o valor de R2 em R3
	MOV [R0], R3						;Coloca o endere�o de R3 no valor de R0
	ADD R2, 2 							;estamos a trabalhar com palavras por isso adicionamos 2
	ADD R0, 2							;Adiciona 2 ao endere�o de R0
	CMP R0, R1							;Compara R0 com R1
	JLE ciclo							;Se R1 for menor que R0, salta para a rotina ciclo
	POP R3								;----------------------------------------------------
	POP R1								;- Remove de dentro da pilha os registos utilizados -
	POP R0								;----------------------------------------------------
	RET									;Retorna a rotina
	
Fim_MostraDisplay:	
	POP R3								;----------------------------------------------------
	POP R1								;- Remove de dentro da pilha os registos utilizados -
	POP R0								;----------------------------------------------------
	RET									;Retorna a rotina

;******************************************************************************************************************
;*								Rotina respons�vel por colocar o display em carateres brancos			     	  *
;******************************************************************************************************************
LimpaDisplay:
	PUSH R0								;-------------------------------------------------
	PUSH R1								;- Coloca dentro da pilha os registos a utilizar -
	PUSH R3								;-------------------------------------------------
	MOV R0, Display						;Coloca em R0 o Display
	MOV R1, Display_End					;Coloca em R1 o fim do Display
	MOV R3, CaraterVazio				;Coloca em R3 o carater vazio
	
CicloLimpa:
	MOVB [R0], R3						;Coloca o endere�o de R3 no valor de R0 bit a bit 
	CMP R0, R1							;Compara R0 com R1
	JGE FimCicloLimpla					;Se R1 for maior que R0, salta para a rotina FimCicloLimpla
	ADD R0, 1 							;estamos a trabalhar com bits por isso adicionamos 1
	JMP CicloLimpa						;Salta para a rotina CicloLimpa
	
FimCicloLimpla:	
	POP R3								;----------------------------------------------------
	POP R1								;- Remove de dentro da pilha os registos utilizados -
	POP R0								;----------------------------------------------------
	RET 								;Retorna a rotina

;******************************************************************************************************************
;*			Rotina respons�vel por colocar os perifericos de entrada(BTN_NR_SEL, BTN_OK) em carateres brancos     *
;******************************************************************************************************************

LimpaButoes:
	PUSH R0								;-------------------------------------------------
	PUSH R1								;- Coloca dentro da pilha os registos a utilizar -
	PUSH R2								;-------------------------------------------------
	MOV R0, BTN_NR_SEL					;Coloca em R0 o valor de escolha do bot�o de sele��o
	MOV R1, BTN_OK						;Coloca em R1 o valor do bot�o ok
	MOV R2, 0 							;Coloca o valor 0 em R2
	MOV [R0], R2						;Coloca o endere�o R2 no valor de R0 
	MOV [R1], R2						;Coloca o endere�o R2 no valor de R1
	POP R2								;----------------------------------------------------
	POP R1								;- Remove de dentro da pilha os registos utilizados -
	POP R0								;----------------------------------------------------
	RET									;Retorna a rotina

;******************************************************************************************************************
;*			Rotina respons�vel por colocar os perifericos de entrada (username,password) em carateres brancos     *
;******************************************************************************************************************

LimpaPeriferiosUserPass:
	PUSH R0								;-------------------------------------------------
	PUSH R1								;-												 -
	PUSH R3								;-												 -
	PUSH R4								;- Coloca dentro da pilha os registos a utilizar -
	PUSH R5								;-												 -
	PUSH R6								;-												 -
	PUSH R7								;-------------------------------------------------
 	MOV R0, InInicioUsername			;Coloca em R0 o endere�o do inicio do username introduzido pelo cliente
	MOV R1, InFimUsername				;Coloca em R1 o endere�o do fim do username introduzido pelo cliente
	MOV R3, InInicioPassword			;Coloca em R3 o endere�o do inicio da password introduzida pelo cliente
	MOV R4, InFimPassword				;Coloca em R4 o endere�o do fim da password introduzida pelo cliente
	MOV R5, 0							;Coloca o valor 0 em R5
	MOV R6, [R0]						;Coloca o valor de R0 em R6
	MOV R7, [R3]						;Coloca o valor de R3 em R7
ciclo_limpa_user:
	CMP R6, 0							;Compara R6 com 0
	JEQ ciclo_limpa_pass				;Se R6 for igual a 0, salta para a rotina ciclo_limpa_pass
	CMP R0, R1							;Compara R0 com R1
	JEQ ciclo_limpa_pass				;Se R0 for igual a R1, salta para a rotina ciclo_limpa_pass
	MOVB[R0], R5						;Coloca o endere�o de R5 no valor de R0 bit a bit
	ADD R0, 1							;Adiciona 1 no endere�o de R0
	JMP ciclo_limpa_user				;Salta para o ciclo_limpa_user
	
ciclo_limpa_pass:
	CMP R7, 0							;Compara R7 com 0
	JEQ FIM_LIMPA						;Se R7 for igual a 0, salta para a rotina FIM_LIMPA
	CMP R3, R4							;Compara R3 com R4
	JEQ FIM_LIMPA						;Se R3 for igual a R4, salta para a rotina FIM_LIMPA
	MOVB[R3], R5						;Coloca o endere�o de R3 no valor de R3 bit a bit
	ADD R3, 1							;Adiciona 1 no endere�o de R3
	JMP ciclo_limpa_pass				;Salta para a rotina ciclo_limpa_pass
	
FIM_LIMPA:
	POP R7								;----------------------------------------------------
	POP R6								;-													-
	POP R5								;-													-
	POP R4								;- Remove de dentro da pilha os registos utilizados -
	POP R3								;-													-
	POP R1								;-													-
	POP R0								;----------------------------------------------------
	RET									;Retorna a rotina

;******************************************************************************************************************
;*							Rotina respons�vel por verificar se o bot�o BTN_OK foi ativado				          *
;******************************************************************************************************************	
	
Verifica_OK:
	PUSH R1								;Coloca dentro da pilha os registos a utilizar
	PUSH R3								;Coloca dentro da pilha os registos a utilizar
	MOV R1, BTN_OK						;Coloca em R1 o valor do bot�o ok
	
ciclo_OK:
	MOVB R3, [R1]						;Coloca o valor de R1 bit a bit no endere�o R3
	CMP R3, 1							;Compara R3 com 1
	JNE ciclo_OK						;Se R3 � diferente de 1, salta para a rotina ciclo_OK
	POP R3								;Remove de dentro da pilha os registos utilizados
	POP R1								;Remove de dentro da pilha os registos utilizados
	RET									;Retorna a rotina