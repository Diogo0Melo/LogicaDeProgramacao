programa
{

	// INFORMAÇÃO DE EXTREMA IMPORTÂNCIA
	// Execute esse código no Portugol WebStudio, o Portugol Studio não executa e eu ainda n encontrei o problema!!!
	
	inclua biblioteca Util
	inclua biblioteca Tipos
	cadeia bancoDeDados[10][5], saldoEmConta, saldoEmMaos, extrato
	funcao inicio()
	{

		
		
		// cada coluna contém uma informação sobre a conta 0 = senha, 1 = nome, 2 = saldo em conta, 3 = saldo em mãos, 4 = extrato da conta
		
		cadeia opcao

		para(inteiro i = 0; i < 10; i++){
        		para(inteiro j = 0; j < 5; j++){
          		bancoDeDados[i][j] = ""
        		}
     	 }
		
		faca{
			
			escreva("Bem Vindo ao Banco Tchan!!!\n")

			
			escreva("\n1 - Criar Conta, 2 - Entrar na Conta, 0 - Encerrar\n")
			escreva("Digite uma das opções acima: ")
			leia(opcao)
			se(opcao == "0") retorne
				
			senao se (opcao == "1") criarConta()
			
			senao se (opcao == "2") entrarConta()
			
			
		}enquanto(opcao != "0")
		
		
		
	}
	funcao vazio criarConta(){
		cadeia nome = "", senha = "", confirmarSenha
		logico nomeValido = falso, senhaValida = falso, confirmarSenhaValida = falso
		

		enquanto(nao nomeValido){
			escreva("\nDigite seu nome: ")
			leia(nome)

			se(nome != "") nomeValido = verdadeiro
			senao mensagemDeErroGenerica()
		}
		enquanto(nao senhaValida){
			inteiro senhaInteiro
			escreva("\nSua senha só pode conter números e deve ter 4 dígitos! Ex: 0000 ")
			escreva("\nCrie uma senha: ")
			leia(senha)
			se(Tipos.cadeia_e_inteiro(senha, 10)){
				para (inteiro i = 0; i <= 9; i++ ){
					para (inteiro j = 0; j <= 9; j++){
						para (inteiro k = 0; k <= 9; k++){
							para (inteiro l = 0; l <= 9; l++){
								cadeia testeSenha = Tipos.inteiro_para_cadeia(i, 10) + Tipos.inteiro_para_cadeia(j, 10) + Tipos.inteiro_para_cadeia(k, 10) + Tipos.inteiro_para_cadeia(l, 10)
								se (senha == testeSenha) senhaValida = verdadeiro
								
							}
						}
					}
				}
				se(nao senhaValida)mensagemDeErroGenerica()
			}
			senao mensagemDeErroGenerica()
		}

		faca{
			escreva("Digite sua senha novamente: ")
			leia(confirmarSenha)

			se(confirmarSenha == senha) confirmarSenhaValida = verdadeiro
			senao escreva("Algo deu errado! Tente denovo.\n")
			
		}enquanto(nao confirmarSenhaValida)

		cadastrarContaNoBancoDeDados(nome, senha)

		escreva("\n\nConta Criada Com Sucesso! Use 2 no painel principal para acessa-lá.\n\n")
		aperteEnterParaContinuar()
		
	}
	
	funcao vazio cadastrarContaNoBancoDeDados( cadeia nome, cadeia senha){
		
		para(inteiro i = 0; i < 10; i++){
			para(inteiro j = 0; j < 1; j++){
				se(bancoDeDados[i][j] == ""){
					bancoDeDados[i][0] = senha
					bancoDeDados[i][1] = nome
					bancoDeDados[i][2] = "0.0"
					bancoDeDados[i][3] = "0.0"
					bancoDeDados[i][4] = ""
					retorne
				}
			}
		}
		escreva("\n\nVixi! O banco lotou!!!\n\n")
		
	}

	funcao vazio entrarConta(){
		cadeia senha
		inteiro tentativas = 3
		enquanto(tentativas > 0){
			escreva("\nDigite sua senha: ")
			leia(senha)
			inteiro informacoesCliente = verificarSenhaNoBancoDeDados(senha)
	
			se (informacoesCliente != -1){
				cadeia senhaRetornada = bancoDeDados[informacoesCliente][0]
				cadeia nome = bancoDeDados[informacoesCliente][1]
				saldoEmConta = bancoDeDados[informacoesCliente][2]
				saldoEmMaos = bancoDeDados[informacoesCliente][3]
				extrato = bancoDeDados[informacoesCliente][4]
				opcoesDaConta(informacoesCliente, senhaRetornada, nome)
				retorne
			}
			mensagemDeErroGenerica()
			escreva("\nVocê utilizou uma tentativa restam ", --tentativas," antes de retornamos ao menu principal.")
			se(tentativas == 0){
				escreva("\n\nLimite de tentativas! Retornando ao menu\n")
				Util.aguarde(5000)
				retorne
			}
		}
	}

	funcao inteiro verificarSenhaNoBancoDeDados(cadeia senha){
		para (inteiro i =0; i < 10; i++){
			para(inteiro j = 0; j < 1; j++){
	
				se (senha == bancoDeDados[i][j]) retorne i
	
			}
		}
		retorne -1
	}
	funcao vazio opcoesDaConta(inteiro cliente, cadeia senha, cadeia nome){

		escreva("Olá, ",nome,"!")
		Util.aguarde(3000)
		inteiro opcao
		faca{
			
			cadeia opcaoString
			logico opcaoInvalida = verdadeiro
			
			enquanto(opcaoInvalida){
				
				escreva("\n1 - Ver Extrato, 2 - Sacar, 3 - Depositar, 4 - Ver Saldo, 5 - Trabalhar, 0 - Sair\n")
				escreva("Digite uma das opções acima: ")
				leia(opcaoString)
				se (Tipos.cadeia_e_inteiro(opcaoString,10)){
					opcao = Tipos.cadeia_para_inteiro(opcaoString, 10)
					se(opcao >=0 e opcao <= 5) opcaoInvalida = falso
				}
				senao mensagemDeErroGenerica()
				
			}
			
			escolha(opcao){
				caso 0:
					escreva("\nVocê saiu! Retornando ao menu principal.\n")
					Util.aguarde(5000)
					retorne
				pare
				caso 1:
					verExtrato()
				pare
				caso 2:
					sacar(cliente)
				pare
				caso 3:
					depositar(cliente)
				pare
				caso 4:
					escreva("\nSeu saldo em conta é de R$",saldoEmConta,"\nSeu saldo em mãos é de R$",saldoEmMaos)
				pare
				caso 5:
					trabalhar(cliente)
				pare

					
			}
			
			
		}enquanto(opcao != 0)
		
			
	}
	funcao vazio trabalhar(inteiro cliente){
		inteiro salario = Util.sorteia(57, 909)
		real saldoEmMaosReal
		
		escreva("\n\nTRABALHANDO!!!")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".")
		Util.aguarde(1000)
		escreva(".\n\n")

		escreva("\nVocê concluiu sua jornado de 8 horas de trabalho e recebeu R$:",salario,"\n")
		saldoEmMaosReal = Tipos.cadeia_para_real(saldoEmMaos)
		saldoEmMaosReal += salario
		saldoEmMaos = Tipos.real_para_cadeia(saldoEmMaosReal)

		bancoDeDados[cliente][3] = saldoEmMaos
		retorne
		
	}
	funcao vazio verExtrato(){
		se(extrato == "") escreva("Não há extratos disponiveis")
		senao {
			escreva("\n\nExtrato:\n\n",extrato)
		}
		retorne
	}

	funcao vazio sacar(inteiro cliente){
		cadeia valorSacar = ""
		logico valorInvalido = verdadeiro
		real valorSacarReal, saldoEmContaReal, saldoEmMaosReal
		inteiro tentativas = 3
		enquanto(valorInvalido e tentativas > 0){
			escreva("\nDigite o valor a ser sacado: ")
			leia(valorSacar)

			se(Tipos.cadeia_e_real(valorSacar) ou Tipos.cadeia_e_inteiro(valorSacar, 10)){
				valorSacarReal = Tipos.cadeia_para_real(valorSacar)
				saldoEmContaReal = Tipos.cadeia_para_real(saldoEmConta)
				saldoEmMaosReal = Tipos.cadeia_para_real(saldoEmMaos)

				se(valorSacarReal <= saldoEmContaReal e valorSacarReal > 0){
					saldoEmMaosReal += valorSacarReal
					saldoEmContaReal -= valorSacarReal
					escreva("Você sacou R$"+valorSacarReal)
					
					extrato += ("\nSaque de R$"+valorSacarReal)

					saldoEmConta = Tipos.real_para_cadeia(saldoEmContaReal)
					saldoEmMaos = Tipos.real_para_cadeia(saldoEmMaosReal)
					
					bancoDeDados[cliente][2] = saldoEmConta
					bancoDeDados[cliente][3] = saldoEmMaos
					bancoDeDados[cliente][4] = extrato

					valorInvalido = falso

					retorne
					
				}senao mensagemDeErroGenerica()
				escreva("Você usou uma tentativa restam ",--tentativas,"!!!")
				
			}senao mensagemDeErroGenerica()
			escreva("Você usou uma tentativa restam ",--tentativas,"!!!")
			
		}
		retorne
	}

	funcao vazio depositar(inteiro cliente){
		cadeia valorDepositar = ""
		logico valorInvalido = verdadeiro
		real valorDepositarReal, saldoEmContaReal, saldoEmMaosReal
		inteiro tentativas = 3
		enquanto(valorInvalido e tentativas > 0){
			escreva("\nDigite o valor a ser depósitado: ")
			leia(valorDepositar)

			se(Tipos.cadeia_e_real(valorDepositar) ou Tipos.cadeia_e_inteiro(valorDepositar, 10)){
				valorDepositarReal = Tipos.cadeia_para_real(valorDepositar)
				saldoEmContaReal = Tipos.cadeia_para_real(saldoEmConta)
				saldoEmMaosReal = Tipos.cadeia_para_real(saldoEmMaos)
				se(valorDepositarReal <= saldoEmMaosReal e valorDepositarReal > 0){
					saldoEmMaosReal -= valorDepositarReal
					saldoEmContaReal += valorDepositarReal
					escreva("Você depósitou R$"+valorDepositarReal)
					
					extrato += ("\nDepósito de R$"+valorDepositarReal)

					saldoEmConta = Tipos.real_para_cadeia(saldoEmContaReal)
					saldoEmMaos = Tipos.real_para_cadeia(saldoEmMaosReal)
					
					bancoDeDados[cliente][2] = saldoEmConta
					bancoDeDados[cliente][3] = saldoEmMaos
					bancoDeDados[cliente][4] = extrato

					valorInvalido = falso
					retorne
				}senao mensagemDeErroGenerica()
				escreva("Você usou uma tentativa restam ",--tentativas,"!!!")
				
			}senao mensagemDeErroGenerica()
			escreva("Você usou uma tentativa restam ",--tentativas,"!!!")
			
		}
		retorne
	}
	
	funcao vazio mensagemDeErroGenerica(){
		escreva("\nAlgo deu errado! Tente denovo.\n")
	}
	funcao vazio aperteEnterParaContinuar(){
		cadeia continuar
		escreva("\nAperte Enter para continuar\n")
		leia(continuar)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 163; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */