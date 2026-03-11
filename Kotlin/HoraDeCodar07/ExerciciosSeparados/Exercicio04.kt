package HoraDeCodar07.ExerciciosSeparados

import kotlin.math.ceil

// 4) Que horas você pode?

val DIAS_SEMANA = arrayOf("segunda", "terca", "quarta", "quinta", "sexta")
val DIAS_FIM_SEMANA = arrayOf("sabado", "domingo")

class Auditorio(
    val nome: String,
    val capacidade: Int,
    val capacidadeAdicional: Int,
    val reservas: MutableList<String> = mutableListOf()
)

interface CustosEvento {

    val nome: String
    val quantidade: Int
    val custo: Double
    val custoTotal: Double

    fun calcularCustoTotal(): Double {
        return this.custo * this.quantidade
    }

}

class Garcom(override val custo: Double, qtdConvidados: Int, duracaoEvento: Int) : CustosEvento {
    override val nome: String = "Serviço de Garçom"
    override val quantidade: Int = calcularQtd(qtdConvidados, duracaoEvento)
    override val custoTotal: Double = calcularCustoTotal()

    fun calcularQtd(qtdConvidados: Int, duracaoEvento: Int): Int {
        var qtd = ceil(qtdConvidados / 12.0).toInt()
        for (i in 1..duracaoEvento) if (i % 2 == 0) qtd++
        return qtd
    }

}

class Item(override val nome: String, override val custo: Double, qtdConvidados: Int, consumoPorPessoa: Double) :
    CustosEvento {

    override var quantidade: Int = calcularQtd(qtdConvidados, consumoPorPessoa)
    override var custoTotal: Double = calcularCustoTotal()

    fun calcularQtd(qtdConvidados: Int, consumoPorPessoa: Double): Int {
        return ceil(qtdConvidados * consumoPorPessoa).toInt()
    }

}

val auditorios = arrayOf(
    Auditorio("Auditório laranja", 150, 70),
    Auditorio("Auditório colorado", 350, 0)
)

fun reservarAuditorio() {
    println("RESERVA AUDITÓRIO PARA EVENTO\n")
    val qtdConvidados = solicitarQtdConvidados()
    val auditorio = calcularAuditorio(qtdConvidados)

    println("Agora vamos ver a agenda do evento.")
    enter()

    val diaEvento = solicitarDiaEvento(auditorio)
    val horarioEvento = solicitarHorarioEvento(diaEvento)
    val nomeEmpresa = solicitarNomeEmpresa()

    println("Auditório reservado para $nomeEmpresa. $diaEvento às ${horarioEvento}h.")
    enter()

    val duracaoEvento = solicitarDuracaoEvento(diaEvento, horarioEvento)
    val garcons = Garcom(10.5, qtdConvidados, duracaoEvento)
    println("São necessários ${garcons.quantidade} garçons.")
    println("Custo: R$${garcons.custoTotal}")

    println("Agora vamos calcular o custo do buffet do hotel para o evento.")
    enter()

    val cafe = Item("Café", 0.8, qtdConvidados, 0.2)
    val agua = Item("Água", 0.4, qtdConvidados, 0.5)
    val salgado = Item("Salgado", 0.34, qtdConvidados, 7.0)
    val custoBuffet = cafe.custoTotal + agua.custoTotal + salgado.custoTotal

    println("O evento precisará de ${cafe.quantidade} litros de café, ${agua.quantidade} litros de água, ${salgado.quantidade} salgados.")
    enter()

    println("Evento no $auditorio")
    println("Nome da Empresa: $nomeEmpresa")
    println("Data: $diaEvento, ${horarioEvento}h às ${horarioEvento + duracaoEvento}")
    println("Duração do evento: $duracaoEvento")
    println("Quantidade de garçons: R$${garcons.quantidade}")
    println("Quantidade de Convidados: R$$qtdConvidados")

    println("\nCusto dos garçons: R$${"%.2f".format(garcons.custoTotal)}")
    println("Custo do Buffet: R$${"%.2f".format(custoBuffet)}")

    println("\nValor total do Evento: ${"%.2f".format(garcons.custoTotal + custoBuffet)}")
    enter()

    return confirmarReserva(auditorio, diaEvento)
}

fun solicitarQtdConvidados(): Int {
    println("Qual o número de convidados para o seu evento?")
    val qtdConvidados = readln().toIntOrNull()
    return if (qtdConvidados != null && qtdConvidados in 1..350) {
        qtdConvidados
    } else {
        println("Número de convidados inválido")
        enter()
        solicitarQtdConvidados()
    }
}

fun calcularAuditorio(qtdConvidados: Int): Auditorio {
    return when (qtdConvidados) {
        in 1..220 -> {
            val cadeirasExtras = if (qtdConvidados > 150) "inclua mais ${qtdConvidados - 150} cadeiras" else ""
            println(
                "Use o auditório Laranja ($cadeirasExtras)"
            )
            auditorios[0]
        }

        in 221..350 -> {
            println("Use o auditório Colorado")
            auditorios[1]
        }

        else -> calcularAuditorio(qtdConvidados)
    }
}

fun solicitarDiaEvento(auditorio: Auditorio): String {
    for (i in 0..6) {
        if (i < DIAS_SEMANA.size) print("${DIAS_SEMANA[i]}; ")
        else print("${DIAS_FIM_SEMANA[i - DIAS_SEMANA.size]}; ")
    }
    println("\nQual o dia do seu evento?")
    val diaEvento = readln().lowercase()

    return if (auditorio.reservas.contains(diaEvento)) {
        println("Auditório indisponível")
        solicitarDiaEvento(auditorio)
    } else if (DIAS_SEMANA.contains(diaEvento) || DIAS_FIM_SEMANA.contains(diaEvento)) diaEvento
    else {
        println("Dia inválido!")
        solicitarDiaEvento(auditorio)
    }
}

fun solicitarHorarioEvento(diaEvento: String): Int {
    println("Qual é a hora do evento?")
    val horarioEvento = readln().toIntOrNull() ?: -1
    return when {
        DIAS_SEMANA.contains(diaEvento) -> {
            if (horarioEvento in 7..23) horarioEvento
            else {
                println("De segunda a sexta os auditórios só funcionam das 7h às 23h")
                solicitarHorarioEvento(diaEvento)
            }
        }

        DIAS_FIM_SEMANA.contains(diaEvento) -> {
            if (horarioEvento in 7..15) horarioEvento
            else {
                println("No fim de semana os auditórios só funcionam das 7h às 15h")
                solicitarHorarioEvento(diaEvento)
            }
        }

        else -> {
            println("Horário inválido!")
            solicitarHorarioEvento(diaEvento)
        }
    }
}

fun solicitarNomeEmpresa(): String {
    println("Qual o nome da empresa?")
    return readln().ifBlank { solicitarNomeEmpresa() }
}

fun solicitarDuracaoEvento(diaEvento: String, horarioEvento: Int): Int {
    println("Qual a duração do evento em horas?")
    val duracaoEvento = readln().toIntOrNull()

    if (duracaoEvento == null || DIAS_SEMANA.contains(diaEvento) && (horarioEvento + duracaoEvento) > 23) {
        println("Duração inválida! Em dias úteis o evento só pode ir até as 23h")
        return solicitarDuracaoEvento(diaEvento, horarioEvento)
    } else if (DIAS_FIM_SEMANA.contains(diaEvento) && (horarioEvento + duracaoEvento) > 15) {
        println("Duração inválida! No fim de semana o evento só pode ir até as 15h")
        return solicitarDuracaoEvento(diaEvento, horarioEvento)
    }
    return duracaoEvento

}

fun confirmarReserva(auditorio: Auditorio, diaReserva: String) {
    println("Gostaria de efetuar a reserva? S/N")
    val escolha = readln().uppercase()

    return when (escolha) {
        "S" -> reservaConfirmada(auditorio, diaReserva)
        "N" -> reservaCancelada()
        else -> confirmarReserva(auditorio, diaReserva)
    }
}

fun reservaConfirmada(auditorio: Auditorio, diaReserva: String) {
    println("Reserva efetuada com sucesso")
    auditorio.reservas.add(diaReserva)
    enter()
    return inicio()
}

fun reservaCancelada() {
    println("Reserva não efetuada.")
    enter()
    return inicio()
}
