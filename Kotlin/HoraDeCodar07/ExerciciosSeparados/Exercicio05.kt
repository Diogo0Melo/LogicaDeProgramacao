package HoraDeCodar07.ExerciciosSeparados

// 5) Álcool ou gasolina?

fun abastecimentoDeAutomoveis() {

    println("Qual o valor do álcool no posto Wayne Oil?")
    val valorAlcoolWayneOil: Double? = readln().toDoubleOrNull()

    println("Qual o valor da gasolina no posto Wayne Oil?")
    val valorGasolinaWayneOil: Double? = readln().toDoubleOrNull()

    println("Qual o valor do álcool no posto Stark Petrol?")
    val valorAlcoolStarkPetrol: Double? = readln().toDoubleOrNull()

    println("Qual o valor da gasolina no posto Stark Petrol?")
    val valorGasolinaStarkPetrol: Double? = readln().toDoubleOrNull()

    if (valorAlcoolWayneOil == null || valorGasolinaWayneOil == null || valorAlcoolStarkPetrol == null || valorGasolinaStarkPetrol == null) return abastecimentoDeAutomoveis()

    if (valorAlcoolWayneOil < valorAlcoolStarkPetrol) {
        if (valorGasolinaWayneOil < valorGasolinaStarkPetrol) {
            if (valorAlcoolWayneOil / valorGasolinaWayneOil < 0.7) {
                println("${nomeFuncionario}, é mais barato abastecer com alcool no posto Wayne Oil")
                return inicio()
            } else {
                println("${nomeFuncionario}, é mais barato abastecer com gasolina no posto Wayne Oil")
                return inicio()
            }
        } else {
            if (valorAlcoolWayneOil / valorGasolinaStarkPetrol < 0.7) {
                println("${nomeFuncionario}, é mais barato abastecer com alcool no posto Wayne Oil")
                return inicio()
            } else {
                println("${nomeFuncionario}, é mais barato abastecer com gasolina no posto Stark Petrol")
                return inicio()
            }
        }
    } else {
        if (valorGasolinaWayneOil < valorGasolinaStarkPetrol) {
            if (valorAlcoolStarkPetrol / valorGasolinaWayneOil < 0.7) {
                println("${nomeFuncionario}, é mais barato abastecer com alcool no posto Stark Petrol")
                return inicio()
            } else {
                println("${nomeFuncionario}, é mais barato abastecer com gasolina no posto Wayne Oil")
                return inicio()
            }
        } else {
            if (valorAlcoolStarkPetrol / valorGasolinaStarkPetrol < 0.7) {
                println("${nomeFuncionario}, é mais barato abastecer com alcool no posto Stark Petrol")
                return inicio()
            } else {
                println("${nomeFuncionario}, é mais barato abastecer com gasolina no posto Stark Petrol")
                return inicio()
            }
        }
    }
}