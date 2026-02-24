programa{

	inclua biblioteca Util --> u
	
	funcao inicio(){

		
	
		/* Exercicio 1
		 *  Escreva um programa em que o usuário informe dois números. Então escreva em tela o maior deles.
		 */

		real maiorNumero = verificarMaiorNumero()

		escreva("Dentre os numero digitados o maior é: "+maiorNumero)
		aguardeDepoisLimpe()
		
		/* Exercicio 2
		* Faça um programa que leia um valor 
		* informado pelo usuário e diga se o valor 
		* informado é positivo, negativo ou zero.
		*/
		
		cadeia sinalOuZero = verificarSinalOuZero()
		
		escreva("O número digitado é: "+sinalOuZero)
		aguardeDepoisLimpe()

		
		/*Exercicio 3
		* Faça um programa para ler 3 valores
		* (considere que não serão informados
		* valores iguais) e escrever o maior deles.
		*/
		
		real maiorValor = verificarMaiorValor()
		
		escreva("O maior valor dentre os digitados é: "+maiorValor)
		aguardeDepoisLimpe()
		
		/*Exercicio 4
		* Faça um programa que leia 3 valores 
		* informados pelo usuário (considere que
		* não serão informados valores iguais) e 
		* escrever a soma dos 2 maiores.
		*/
		
		real somaMaioresValores = somarDoisMaioresValores()

		escreva("A soma dos 2 maiores valores informados é: "+ somaMaioresValores)
		aguardeDepoisLimpe()

		/*Exercicio 5
		 * Faça um programa que leia 6 valores informados pelo usuário, calcule, exiba os números 
		 * informados e escreva a média aritmética desses valores lidos.
		 */

		real valoresMediaAritmetica[7]
		calcularMediaAritmetica(valoresMediaAritmetica)
		escreva("Os valores fornecidos foram: \n")
		para(inteiro i=0; i<6; i++){
			se (i != 5) escreva(valoresMediaAritmetica[i]+" - ")
			senao escreva(valoresMediaAritmetica[i])
		}
		escreva("\nA média aritmetica dos valores é: "+valoresMediaAritmetica[6] )
		aguardeDepoisLimpe()


		/*Exercicio 6
		 * Faça um programa que receba quatro valores informados pelo usuário, mas informe 
		 * somente o primeiro, o último e o maior de todos eles (considere que todos os números informados serão diferentes)
		 */

		real valorTempEx6, valoresEx6[4], maiorValorEx6 = 0.0
		
		para(inteiro i = 0; i<4; i++){
			escreva("Digite o ",(i+1),"º valor: ")
			leia(valorTempEx6)
			valoresEx6[i] = valorTempEx6
			se(i==0) maiorValorEx6 = valorTempEx6
			se(valorTempEx6 > maiorValorEx6) maiorValorEx6 = valorTempEx6
		}
		escreva("O primeiro valor digitado foi: ",valoresEx6[0],"\nO último valor digitado foi: ",valoresEx6[3],"\nO maior valor digitado foi: ",maiorValorEx6)
		aguardeDepoisLimpe()


		/* Exercicio 7
		 *  Faça um programa que leia 6 números que o usuário vai informar. Todos os números lidos com valor inferior a 72 devem ser somados. 
		 *  Escreva o valor final da soma efetuada e também todos valores que o usuário informou.  
		 */

		real valoresEx7[6], resultadoSomaEx7 = 0.0

		para(inteiro i = 0; i < 6; i++){
			real valorTemp
			escreva("Qual é o ", (i+1), "º valor: ")
			leia(valorTemp)
			valoresEx7[i] = valorTemp
			se (valorTemp < 72) resultadoSomaEx7 += valorTemp
		}
		escreva("Os valores informados foram:\n")
		para(inteiro i = 0; i < 6; i++){
			se (i == 5) escreva(valoresEx7[i])
			senao escreva(valoresEx7[i], " | ")
			
		}
		escreva("\nO resultado da soma é: ", resultadoSomaEx7)
		aguardeDepoisLimpe()
		
		/*Exercicio 8
		 * Escreva um programa que calcule a média de quatro números informados pelo usuário, mas somente se esses números forem 
		 * maiores que 0 e menores que 10. No final, se a média for maior que cinco o usuário receberá uma mensagem "Você passou no teste". 
		 * Em qualquer outra situação, ele receberá uma mensagem de "tente novamente"
		 */

		real valoresEx8[4], mediaValores = 0.0

		para(inteiro i = 0; i < 4; i++){
			real valorTemp
			logico condicao
			
			
			faca{
				escreva("Digite o ",(i+1),"º número entre 1 e 9: ")
				leia(valorTemp)
				condicao = (valorTemp > 0 e valorTemp < 10)
				se(nao condicao) escreva("O número digitado deve estar entre 1 e 9\n")
			}enquanto(nao condicao)
			valoresEx8[i] = valorTemp
			mediaValores += valorTemp
		}
		mediaValores /= 4

		se(mediaValores > 5) escreva("Você passou no teste")
		senao escreva("Tente novamente")
		
	}
	funcao vazio aguardeDepoisLimpe(){
		/*a variavel abaixo deve ser utilizada quando necessitar manter o historico do console, porém a formatação que já não é boa
		 * vai ficar ainda pior. falso = vai apagar os resultados a cada exercicio, verdadeiro = nunca limpa o console
		 */
		
		logico manterHistorico = falso

		se (manterHistorico == verdadeiro) {retorne}
		
		escreva("\n\n\nExercicio encerrado! o próximo exercicio começa em: 10 segundos\n")
		u.aguarde(6000)
		escreva("4\n")
		u.aguarde(1000)
		escreva("3\n")
		u.aguarde(1000)
		escreva("2\n")
		u.aguarde(1000)
		escreva("1\n")
		u.aguarde(1000)
		limpa()
		escreva("A Limpeza do console foi concluida\n\n\n")
		}

	funcao real verificarMaiorNumero(){
		real numero1, numero2

		escreva("Digite o primeiro número: ")
		leia(numero1)

		escreva("Digite o segundo número: ")
		leia(numero2)

		se (numero1 > numero2){
			retorne numero1
		}

		retorne numero2
		
		}

	funcao cadeia verificarSinalOuZero(){
	 	real numero
	 	escreva("Digite um número: ")
	 	leia(numero)

	 	se (numero > 0) retorne "positivo"
	 	senao se (numero < 0) retorne "negativo"
	 	retorne "zero"
	 }
	 
	funcao real verificarMaiorValor(){
	 	real valor = 0.0, valorTemp
	 	para(inteiro i=0; i < 3;i++){
	 		escreva("\nDigite o "+(i+1)+"° valor: ")
	 		leia(valorTemp)
	 		se(i == 0) valor = valorTemp
	 		senao se (valorTemp > valor) valor = valorTemp
	 	}
	 	retorne valor
	 }
	 
	funcao real somarDoisMaioresValores(){
	 	real valores[3]
	 	real valorTemp
	 	para(inteiro i=0; i < 3;i++){
	 		escreva("\nDigite o "+(i+1)+"° valor: ")
	 		leia(valorTemp)
	 		valores[i] = valorTemp
	 	}
	 	para (inteiro i=2; i > 0 ;i--){
	 		para (inteiro j=0; j < i; j++){
	 			valorTemp = valores[j+1]
	 			se (valores[j] > valorTemp){
	 				real valorTemp2 = valores[j]
	 				valores[j] = valorTemp
	 				valores[j+1] = valorTemp2	
	 				}
	 		}
	 	}
	 	retorne valores[1] + valores[2]
	 }
	
	funcao vazio calcularMediaAritmetica(real valores[]){

		para (inteiro i=0; i < 6; i++){
			escreva("Informe o "+(i+1)+"º valor: ")
			leia(valores[i])
		}
		real resultadoMediaAritmetica = 0.0
		para (inteiro i=0; i<6; i++){
			resultadoMediaAritmetica += valores[i]
		}
		valores[6] = resultadoMediaAritmetica/6
		retorne
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4129; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz;
 */