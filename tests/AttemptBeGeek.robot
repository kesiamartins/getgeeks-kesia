*Settings*
Documentation       Attempt Be Geek Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Suite Setup          Start Session For Attempt Be Geek
Test Template       Attempt Be A Geek

*Variables*
${long_desc}    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in arcu vel purus malesuada bibendum. Praesent hendrerit, ante a pulvinar vehicula, turpis lacus fringilla metus, et fermentum turpis arcu nec leo. Aenean sit amet libero mi. Sed pharetra donec.

*Test Cases*
Short desc          desc    Formato o seu PC            A descrição deve ter no minimo 80 caracteres
Long desc           desc    ${long_desc}                A descrição deve ter no máximo 255 caracteres
Empty desc          desc            ${EMPTY}                    Informe a descrição do seu trabalho
Whats only ddd      whats           11                          O Whatsapp deve ter 11 digitos contando com o DDD
Whats only number   whats           999999999                   O Whatsapp deve ter 11 digitos contando com o DDD
Empty whats         whats           ${EMPTY}                    O Whatsapp deve ter 11 digitos contando com o DDD
Cost letters        cost            aaaa                        Valor hora deve ser numérico
Cost alpha          cost            aa12                        Valor hora deve ser numérico
Cost special chars  cost            $@#*                        Valor hora deve ser numérico
Empty cost          cost            ${EMPTY}                    Valor hora deve ser numérico
No printer repair   printer_repair  ${EMPTY}                    Por favor, informe se você é um Geek Supremo
No work             work            ${EMPTY}                    Por favor, selecione o modelo de trabalho

*Keywords*
Attempt Be a Geek
    [Arguments]     ${key}  ${input_field}  ${output_message}

    ${user}     Factory User    attempt_be_geek

    Set To Dictionary   ${user}[geek_profile]   ${key}  ${input_field}

    Fill Geek Form  ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be  ${output_message}

    After Test

Start Session For Attempt Be Geek

    ${user}     Factory User    attempt_be_geek

    Start Session
    Do Login  ${user}
    Go To Geek Form