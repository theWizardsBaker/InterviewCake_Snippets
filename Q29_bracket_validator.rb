
# Question 29:
#
#
# You're working with an intern that keeps coming to you with JavaScript code 
# that won't run because the braces, brackets, and parentheses are off. 
# To save you both some time, you decide to write a braces/brackets/parentheses validator.
# Let's say:
# '(', '{', '[' are called "openers."
# ')', '}', ']' are called "closers."

# Write an efficient function that tells us whether or not an input string's openers and closers are properly nested.

def valid_brackets(string)
    openers = ['(','{','[', '|']
    closers = [')','}',']', '|']
    match_open = []
    #walk over each character
    string.each_char do |chr|
        # look for one of the opening or characters
        opening_index = openers.index(chr)
         #if the character is a closing tag
        closing_index = closers.index(chr)
        # if the same character is ini both opener and closers..
        # check if it's value is the last matched opener
        # if so, assume it's the closing tag
        if opening_index == closing_index
            opening_index = nil if match_open.last == opening_index
        end
        # if the character is an open tag, add it to the opening matches
        if opening_index != nil
            match_open << opening_index 
        elsif closing_index != nil
            #find the last open tag
            open_tag_index = match_open.pop()
            #compare the open tag to the closing tag
            return false if open_tag_index != closing_index
        end
    end

    return true
end

string = "print a(b){ b.each |elm| {print elm} } "

puts valid_brackets(string) ? "Valid string!" : "Invalid!"
