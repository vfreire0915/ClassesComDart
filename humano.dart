// Importando a biblioteca dart:io para receber dados do usuário
import 'dart:io';

void main() {
  //Crindo as variáveis e chamando as funções
  print('Qual seu nome?');
  String? input_nome = stdin.readLineSync();
  print('Qual sua idade?');
  String? input_idade = stdin.readLineSync();
  int idade = verificaNuloString(input_idade, 'int');
  print('QUal sua altura?');
  String? input_altura = stdin.readLineSync();
  double altura = verificaNuloString(input_altura, 'double');
  print('Qual é seu peso?');
  String? input_peso = stdin.readLineSync();
  double peso = verificaNuloString(input_peso, 'double');

  // comparando a idade das pessoas para ver em qual parte ela se encaixa
  if(idade < 18) {
    print('$input_nome você está em qual ano?');
    String? input_anoEscolar = stdin.readLineSync();
    int anoEscolar = verificaNuloString(input_anoEscolar, 'int');
    print('Você está indo bem na escola?');
    String? bemNaEscola = stdin.readLineSync();

    Crianca crianca = Crianca(input_nome, idade, altura, peso, anoEscolar, bemNaEscola);
    print('$input_nome você é uma criança!');
    crianca.dadosHumano();
    crianca.calculoImc(altura, peso);
    crianca.escola(bemNaEscola);
    crianca.andar();
    crianca.comer();
    crianca.velocidade();
  } else if(idade >=18 && idade < 60) {
    print('$input_nome você trabalha?');
    String? trabalha = stdin.readLineSync();

    Adulto adulto = Adulto(input_nome, idade, altura, peso, trabalha);
    print('Você é um(a) adulto(a)!');
    adulto.dadosHumano();
    adulto.calculoImc(altura, peso);
    adulto.temTrabalho(trabalha);
    adulto.andar();
    adulto.comer();
    adulto.velocidade();
  } else {
    print('$input_nome você usa bengala?');
    String? temBengala = stdin.readLineSync();

    Idoso idoso = Idoso(input_nome, idade, altura, peso, temBengala);
    print('Você é um(a) idoso(a)!');
    idoso.dadosHumano();
    idoso.calculoImc(altura, peso);
    idoso.bengala(temBengala);
    idoso.andar();
    idoso.comer();
    idoso.velocidade();
  }

}

// funcao para verificar se os dados recebidos do usuário são nulos, e assim converter a string para int ou double
verificaNuloString(input, tipo){
  if(input != null && tipo == 'int'){
    int valorDoInput = int.parse(input);
    return valorDoInput;
  } else if(input != null && tipo == 'double') {
    double valorDoInput = double.parse(input);
    return valorDoInput;
  } else if(input == null){
    print('Informe um valor válido.');
  }
}

// criando as classes e seus métodos
class Humano {
  String nome;
  int idade;
  double altura;
  double peso;

  Humano(this.nome, this.idade, this.altura, this.peso);

  void dadosHumano(){
    print('Seu nome é $nome, sua idade é $idade anos, sua altura é $altura cm e seu peso é $peso kg.');
  }

  // criando um método para que quando chamado efetue o cálculo do imc
  void calculoImc(altura, peso){
    double imc = peso / (altura * altura);
    if(imc < 18.5){
      print('$nome seu imc é $imc, você está abaixo do peso.');
    } else if(imc >= 18.5 && imc < 24.9) {
      print('$nome seu imc é $imc, você está com o peso ideal.');
    } else if (imc >= 24.9 && imc < 29.9) {
      print('$nome seu imc é $imc, você está levemente acima do peso.');
    } else if(imc >= 29.9 && imc < 34.9) {
      print('$nome seu imc é $imc, você com obesidade de grau I.');
    } else if(imc >= 34.9 && imc < 39.9){
      print('$nome seu imc é $imc, você com obesidade de grau II.');
    } else {
      print('$nome seu imc é $imc, você com obesidade de grau III.');
    }
  }
}

class Crianca extends Humano implements FaseDaVida{
  int anoEscolar;
  String? bemNaEscola;

  Crianca(nome, idade, altura, peso, this.anoEscolar, this.bemNaEscola):super(nome, idade, altura, peso);

  void escola(bemNaEscola){
    if(bemNaEscola == 'sim') {
      print('Parabéns, continue assim!');
      print('Está no $anoEscolar ano.');
    } else {
      print('Você precisa estudar mais!');
      print('Está no $anoEscolar ano.');
    }
  }

 // sobrescrevendo as funções da classe abstrata FaseDaVida
  @override
  void andar() {
    print('A criança ($nome) anda meio atrapalhada, pois é criança.');
  }

  @override
  void comer() {
    print('A criança ($nome) derruba toda a comida, pois é criança.');
  }

  @override
  void velocidade() {
    print('A criança ($nome) é muito rápida, pois é criança.');
  }
}

class Adulto extends Humano implements FaseDaVida {
  String? trabalha;

  Adulto(nome, idade, altura, peso, this.trabalha):super(nome, idade, altura, peso);

  void temTrabalho(trabalha) {
    if(trabalha == 'sim'){
    print('Você é trabalhador!');
    } else {
      print('Você está sem emprego no momento!');
    }
  }

  @override
  void andar() {
    print('O adulto(a) ($nome) não tem dificuldade de andar, pois é adulto(a).');
  }

  @override
  void comer() {
    print('O adulto(a) ($nome) não tem dificuldade de comer, pois é adulto(a).');
  }

  @override
  void velocidade() {
    print('O adulto(a) ($nome) não é muito rápido, pois é adulto(a).');
  }
}

class Idoso extends Humano implements FaseDaVida{
  String? temBengala;

  Idoso(nome, idade, altura, peso, this.temBengala):super(nome, idade, altura, peso);

  void bengala(temBengala) {
    if(temBengala == 'sim'){
      print('Você usa bengala!');
    } else {
      print('Você não usa bengala!');
    }
  }

  @override
  void andar() {
    print('O idoso(a) ($nome) tem dificuldade ao andar, pois é idoso(a).');
  }

  @override
  void comer() {
    print('O idoso(a) ($nome) muitas vezes tem dificuldade de comer, pois é idoso(a).');
  }

  @override
  void velocidade() {
    print('O idoso(a) ($nome) é lento, pois é idoso(a).');
  }

}

// Criando uma classe abstrata para usar ela em diferentes situações
abstract class FaseDaVida {

  void andar();

  void comer();

  void velocidade();

}
