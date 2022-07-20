clear;clc
Game_Level = menu('Sudoku Difficulty','Easy', 'Medium', 'Hard');
Dificulty = 0;
%Numbers will be given by difficulty
switch Game_Level
    case 1
        Dificulty = 3; %Average 36-43
        RD = 1;
        quantityMax = 45;
        quantityMin = 35;
        Hehe = '( ͡° ͜ʖ ͡°)';
    case 2
        Dificulty = 3; %Average 28-35
        RD = 1;
        quantityMax = 53;
        quantityMin = 46;
        Hehe = 'ᕙ(▀̿̿Ĺ̯̿̿▀̿ ̿) ᕗ';
    case 3
        Dificulty = 3; %Average 19-24 
        RD =1;
        quantityMax = 62;
        quantityMin = 54;
        Hehe = 'ɿ(｡･ɜ･)ɾⓌⓗⓨ?';
end

%%creates the board with numbers
quantity = 0;
number_Usage_Box = [1:9];
random_counter = 0;
Notation = 1;
while Notation == 1
    sudoku_Board = zeros(9);
    Notation = 0;
for i = 1:3
    for j = 1:3
        number_Usage_Box = [1:9];
        number_Used = [0,0,0,0,0,0,0,0,0];
        random_counter = 0;
        array_Checker = [1];
        for k = 1:3
            number_Used_X = [];
            number_Used_X = sudoku_Board((k+3*(i-1)),:);
            if length(number_Used_X) ~= 9
                for iii = length(number_Used_X)+1:9
                    number_Used_X(iii) = 0;
                end
            end
            for l = 1:3
                number_Used_X = [];
                number_Used_Y = [];
                number_Used_X = sudoku_Board((k+3*(i-1)),:);
                number_Used_Y = sudoku_Board(:,l+3*(j-1));
                number_Used_Y = number_Used_Y';
                Random_spot = randi(RD,1);
                Numby_Usy_boxi = number_Usage_Box((find(number_Usage_Box > 0)));
                number_Input = Numby_Usy_boxi(randi(length(Numby_Usy_boxi),1));              
                if random_counter < (Dificulty*2 + 3) && (Random_spot == RD) 
                     if any(number_Used == number_Input) || any(number_Used_X == number_Input) || any(number_Used_Y == number_Input)
                         bleh = [number_Used,number_Used_X,number_Used_Y];
                         [new_number_Input,N] = Random_with_exclsusion(9,bleh);
                         if N == 25
                             Notation = 1; 
                             break
                         end
                         sudoku_Board(k+3*(i-1),l+3*(j-1)) = new_number_Input;
                         number_Used(find(number_Usage_Box == new_number_Input)) = new_number_Input;
                         number_Usage_Box(find(number_Usage_Box == new_number_Input)) = 0;
                     else
                         number_Used(find(number_Usage_Box == number_Input)) = number_Input;
                         number_Usage_Box(find(number_Usage_Box == number_Input)) = 0;
                         sudoku_Board(k+3*(i-1),l+3*(j-1)) = number_Input;
                     random_counter = random_counter + 1;
                     end
                end
            end
        end
        end
    end
end

final_board_Answer = sudoku_Board_cleaner(sudoku_Board);
final_board_Play = final_board_Answer;
fprintf('Answer Key:  \n\n')
disp(final_board_Answer)

no_o_zero = randi([quantityMin,quantityMax],1);
for i = 1:no_o_zero
    u_Num = 0;
    fo_x = randi(9,1);
    fo_y = randi(9,1);
    
    while final_board_Play(fo_x,fo_y) == 0
        fo_x = randi(9,1);
        fo_y = randi(9,1);
    end
    final_board_Play(fo_x,fo_y) = 0;
end
fprintf('Playable board:           %s \n\n',Hehe)
disp(final_board_Play)
quantity = size(find(final_board_Play > 0));
fprintf('Zeros are what you fill in\nAmmount of numbers given are %i\n', quantity(1));



