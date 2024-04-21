# LogComp-APS


**PetCareLang**

PetCareLang é uma linguagem de programação destinada ao gerenciamento do cuidado diário de animais de estimação. Com ela, é possível criar perfis de pets, agendar atividades, manter registros de saúde e definir alertas importantes.

**Funcionalidades:**
- Gerenciamento de pets com perfis detalhados.
- Agendamento de atividades como alimentação, passeios e consultas veterinárias.
- Registro de eventos de saúde.
- Alertas para lembrar de atividades importantes.
- Suporte a estruturas de programação básicas como loops, condicionais, e operações de entrada/saída.

### EBNF para PetCareLang

```ebnf
program = { statement };

statement = pet_declaration
          | schedule_activity
          | health_record
          | alert
          | var_declaration
          | assignment
          | conditional
          | loop
          | output_statement
          | input_statement
          | comment;

pet_declaration = "pet", identifier, "{", pet_details, "}";
pet_details = "type" "=" string_literal ";" |
              "age" "=" number ";" |
              "name" "=" string_literal ";";

schedule_activity = "schedule", identifier, "{", { activity }, "}";
activity = ("feed" | "walk" | "vet_visit") "(", string_literal ")", ";";

health_record = "record", identifier, "{", { health_event }, "}";
health_event = ("vaccination" | "checkup") "(", string_literal ")", ";";

alert = "alert", "(", string_literal ")", ";";

var_declaration = "int" identifier ("=" expression)? ";";
assignment = identifier "=" expression ";";

conditional = "if" "(" expression ")" "{" { statement } "}" [ "else" "{" { statement } "}" ];
loop = "while" "(" expression ")" "{" { statement } "}";

expression = simple_expression | simple_expression relational_op simple_expression;
simple_expression = term { ("+" | "-") term };
term = factor { ("*" | "/") factor };
factor = identifier | number | "(" expression ")";

output_statement = "print" "(" expression ")" ";";
input_statement = "read" "(" identifier ")" ";";

comment = "//", { all_characters_except_newline };

identifier = letter { letter | digit | "_" };
number = digit { digit };
string_literal = '"' { any_character_except_quotes }, '"';
relational_op = "==" | "!=" | "<" | ">" | "<=" | ">=";
time = '"' number ":" number '"';  // Represented as a string for simplicity
date = '"' number "/" number "/" number '"';  // Represented as a string for simplicity

letter = "a" | "b" | ... | "z" | "A" | "B" | ... | "Z";
digit = "0" | "1" | ... | "9";
all_characters_except_newline = any_visible_character | space;
space = " ";
```

**Como Usar:**
1. Use o comando `pet` para definir um animal de estima

ção.
2. `schedule` permite programar atividades diárias.
3. `record` para manter um histórico de saúde.
4. `alert` para configurar lembretes.
5. Use estruturas como `if`, `while`, `print`, e `read` para lógica e interação.

### Exemplo de Programa em PetCareLang com Estruturas Básicas

```petcarelang
// Definição de um pet
pet Rover {
    type = "Dog";
    name = "Rover";
    age = 6;
}

// Agendamento de atividades
schedule Rover {
    feed("08:00");
    walk("15:00");
    vet_visit("2024/04/13");
}

// Condicional e loop para cuidados de saúde
int daysUntilCheckup = 30;
while (daysUntilCheckup > 0) {
    print("Days until checkup: " + daysUntilCheckup);
    daysUntilCheckup = daysUntilCheckup - 1;
}

if (daysUntilCheckup == 0) {
    alert("Time for Rover's checkup!");
}

// Registro de saúde
record Rover {
    vaccination("2024/04/15");
    checkup("2024/04/20");
}

// Comando de entrada e saída
print("Enter Rover's favorite snack:");
string favoriteSnack;
read(favoriteSnack);
print("Rover's favorite snack is " + favoriteSnack);
```

**Exemplo de Uso:**
O exemplo de código acima mostra como gerenciar o cuidado diário de um cão chamado Rover, incluindo alimentação, passeios, e lembretes para consultas de saúde.