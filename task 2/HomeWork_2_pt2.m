%% Task 2: Caesar Cipher
% a) Function to perform Caesar cipher encryption
function encrypted_message = caesar_cipher(message, shift)
    encrypted_message = '';  % Initialize encrypted message
    for i = 1:length(message)
        char_code = double(message(i)) - 97;  % Get alphabet position (0-based)
        new_code = mod(char_code + shift, 26);  % Apply the shift
        encrypted_message(i) = char(new_code + 97);  % Convert back to character
    end
end

% b) Main script to encrypt a message
message = input('Enter a message to encrypt (lowercase letters): ', 's');
shift = input('Enter a shift value (1-25): ');
encrypted = caesar_cipher(message, shift);
fprintf('Original Message: %s\n', message);
fprintf('Encrypted Message: %s\n', encrypted);