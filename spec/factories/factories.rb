FactoryGirl.define do
  factory(:user) do
    name('Howdy Doody')
    email('thatswhatshesaid@yomama.com')
    password('wybolads')
  end

  factory(:question) do
    title('Javascript issue')
    content('I do not know which framework to use!')
    user
  end

  factory(:response) do
    answer('Ember, fool!')
    user
    question
  end
end
