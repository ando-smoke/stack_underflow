FactoryGirl.define do
  factory(:question) do
    title('Javascript issue')
    content('I do not know which framework to use!')
  end

  factory(:response) do
    answer('Ember, fool!')
    question
  end
end
