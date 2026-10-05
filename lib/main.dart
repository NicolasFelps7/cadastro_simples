import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro Simples',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  // Controllers dos campos
  final TextEditingController nomeController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController idadeController =
      TextEditingController();

  // Dados cadastrados
  String nomeCadastrado = '';
  String emailCadastrado = '';
  String idadeCadastrada = '';

  void cadastrar() {
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    final idade = idadeController.text.trim();

    // Verifica campos vazios
    if (nome.isEmpty || email.isEmpty || idade.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Preencha todos os campos.',
          ),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    // Atualiza os dados na tela
    setState(() {
      nomeCadastrado = nome;
      emailCadastrado = email;
      idadeCadastrada = idade;
    });

    // Limpa os campos
    nomeController.clear();
    emailController.clear();
    idadeController.clear();

    // Mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Cadastro realizado com sucesso!',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    idadeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Cadastro',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const SizedBox(height: 15),

            const Icon(
              Icons.person_add_alt_1,
              size: 75,
              color: Colors.blue,
            ),

            const SizedBox(height: 15),

            const Text(
              'Cadastro de Usuário',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Preencha os dados abaixo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // CAMPO NOME
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                prefixIcon: const Icon(
                  Icons.person_outline,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // CAMPO E-MAIL
            TextField(
              controller: emailController,
              keyboardType:
                  TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // CAMPO IDADE
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Idade',
                hintText: 'Digite sua idade',
                prefixIcon: const Icon(
                  Icons.cake_outlined,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // BOTÃO CADASTRAR
            ElevatedButton(
              onPressed: cadastrar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
              child: const Text(
                'CADASTRAR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // MOSTRA OS DADOS CADASTRADOS
            if (nomeCadastrado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dados cadastrados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Nome: $nomeCadastrado',
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'E-mail: $emailCadastrado',
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Idade: $idadeCadastrada anos',
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}