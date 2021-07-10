# TicTacToe Flutter

Um projeto de IA para o Jogo da Velha usando a linguagem Dart.

## Sobre o projeto

Este projeto, é um Jogo da Velha com uma inteligência artificial capaz de obter, no mínimo, um empate.

## Recursos e Bibliotecas
 - [FlutterModular](https://pub.dev/packages/flutter_modular): para injetar as dependências e facilitar as mudanças de telas.
 - [RxNotifier](https://pub.dev/packages/rx_notifier): para reatividade.
 - [ResponsiveFramework](https://pub.dev/packages/responsive_framework): para tratar da responsividade do projeto em diferentes tamanhos de tela.
 - [Isolate](https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html): para usar o algoritmo da IA em uma rotina diferente da Main (até o momento, não funcionou na Web).
 - [Padrão de Projeto State (Máquina de Estados Finitos)](https://refactoring.guru/pt-br/design-patterns/state/java/example): para gerenciar os estados do jogo.

## Setup
 - Clone este projeto.
 - Use o comando _flutter pub get_ para baixar as dependências.
 - Com um device disponível, use o camando _flutter run_ para executar o projeto.
 - Caso não queira seguir os passos acima, use os recursos da sua IDE.

## Problemas
Até o momento, não foi possível usar uma [_Isolate_](https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html) na compilação para a Web. Neste caso, o algoritmo da IA é executado na rotina principal, bloqueando-a, até que a IA faça a sua jogada. Caso você tenha uma solução, fique à vontade em aplicá-la.