records = [
  [2021],
  [2019, 5],
  [2017, 11, 25],
]

require 'date'

records.map do |record|
  case record.size
  when 1
    # 年を指定、月と日は1固定
    Date.new(record[0],1, 1)
  when 2
    # 年月を指定
    Date.new(record[0], record[1], 1)
  when 3
    # 年月日を指定
    Date.new(record[0], record[1], record[2])
  end
end

# パターンマッチを使う場合
records.map do |record|
  case record
    in [y]
      Date.new(y, 1, 1)
    in [y, m]
      Date.new(y, m, 1)
    in [y, m, d]
      Date.new(y, m, d)
  end
end

record.map do |record|
  case record.size
  when 1
    y = record[0]
    Date.new(y, 1, 1)
  when 2
    y = record[0]
    m = record[1]
    Date.new(y, m, 1)
  when 3
    y = record[0]
    m = record[1]
    d = record[2]
    Date.new(y, m, d)
  end
end

require 'date'

record = [
  [2021],
  [2019, 5],
  [2017, 11, 25],
]
records.map do |record|
  case record
    in [y]
      Date.new(y, 1, 1)
    in[y, m]
      Date.new(y, m, 1)
    in[y, m, d]
      Date.new(y, m, d)
  end
end

# これはcase文(case/when式)
case array
when [1, 2, 3]
  # 省略
end

# これはパターンマッチ(case/in式)
case[1, 2, 3]
in [a, b, c]
  # 省略
end

cars = [
  {name: 'The Beatle', engine: '105ps'},
  {name: 'Prius', engine: '98ps', motor: '72ps'},
  {name: 'Tesla', motor: '306ps'}
]

cars.each do |car|
  if car.key?(:engine) && car.key?(:motor)
    puts "Hybrid: #{car[:name]} / engine: #{car[:engine]} / motor: #{car[:motor]}"
  elsif car.key?(:engine)
    puts "Gasoline: #{car[:name]} / engine: #{car[:engine]}"
  elsif car.key?(:motor)
    puts "EV: #{car[:name]} / motor: #{car}"
  end
end

cars.each do |car|
  case car
  in {name:, engine:, motor:}
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
  in {name:, engine:}
    puts "Gasoline: #{name} / engine: #{engine}"
  in {name:, motor:}
    puts "EV: #{name} / motor: #{motor}"
  end
end

cars.each do |car|
  case car
    in {name: name, engine: engine, motor: motor}
    # 各キーに対応する値をローカル変数name, engine, motorに代入する
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    # 以下略
  end
end

cars.each do |car|
  case car
    in {name:, engine:, motor:}
      # 値を省略してキーのみにすると、対応する値がキーと同じ名前のローカル変数に代入される
      puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    # 以下略
  end
end

country = 'italy'

case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
end

country = 'italy'

message = 
  case country
  in 'japan'
    'こんにちは'
  in 'us'
    'Hello'
  in 'italy'
    'Ciao'
  end

case country
in 'japan' then 'こんにちは'
in 'us' then 'Hello'
in 'italy' then 'Ciao'
end

country = 'india'

# case文の場合は真になる条件がまったくなくてもエラーにならずnilが返るだけ
case country
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'Ciao'
end

# パターンマッチではいずれの条件にもマッチしない場合は例外が発生する
case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
end

country = 'india'

case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
else
  'Unknown'
end

country = 'india'

# 想定外の条件に備えてelse節で意図的に例外をraiseする
case country
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'Ciao'
else
  raise "無効な国名です。 #"
end

# パターンマッチでは自動的に例外が発生するのでelse節が不要
case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
end

country = 'india'

case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
in obj
  # variableパターンを用いて任意のオブジェクトをマッチさせる(実質的なelse節)
  "Unknown: #{obj}"
end

value = 'abc'

case value
in Integer
  '整数です'
in String
  # String === 'abc'が真なのでここにマッチ
  '文字列です'
end

# 文字列もマッチ
case 'Alice'
in obj
  "obj = #{obj}"
end

# 数値もマッチ
case 123
in obj
  "obj = #{obj}"
end

# 配列もマッチ
case [10, 20]
in obj
  "obj = #{obj}"
end

record = [2019, 5]

# パターンにマッチした値(配列の要素)をin句の変数に代入する
case record
in [year]
  "#{year}年です"
in [year, month]
  # 要素数が2つなのでここにマッチ
  "#{year}年#{month}月です"
in [year, month, day]
  "#{year}年#{month}月#{day}日です"
end

alice = 'Alice'
bob = 'Bob'
name = 'Bob'

# ピン演算子を使って事前に定義した変数を参照する
case name
in ^alice #in 'Alice'と書いたのと同じ
  'Aliceさん、こんにちは!'
in ^bob #in 'Bob'と書いたのと同じ(ここにマッチ)
  'Bobさんこんにちは!'
end

records = [
  [7, 7, 7],
  [6, 7, 5]
]

records.each do |record|
  case record
  in [n, ^n, ^n] # 要素数が3つでなおかつ3つとも同じ値であればマッチ
    puts "all same: #{record}"
  else
    puts "not same: #{record}"
  end
end

records = [
  [Integer, 1, 2],
  [Integer, 3, 'X']
]

records.each do |record|
  case record
  in [klass, ^klass, ^klass] #最後の2要素が最初の要素のクラスのインスタンスであればマッチ
    puts "match: #{record}"
  else
    puts "not match: #{record}"
  end
end

# in節でインスタンス変数を使おうとすると構文エラーになる
case 1
in @n
  "@n = #{@n}"
end

@n = 1
# ピン演算子とインスタンス変数を組み合わせると構文エラーになる
case 1
in ^@n
  '1です'
end

# ピン演算子を使いたい場合はいったんローカル変数に入れ直す必要がある
n = @n
case 1
in ^n
  '1です'
end

s = '1'

# ピン演算子とto_iメソッドを組み合わせた場合も構文エラー
case 1
in ^s.to_i
  '1です'
end

case [1, 2, 3]
in [a, b, c]
  # 配列の要素が3つであればマッチし、なおかつ対応する要素が変数a,b,cに代入される
  "a = #{a}, b = #{b}, c = #{c}"
end

case [1,[2, 3]]
in [a, [b,c]]
  "a = #{a}, b = #{b}, c = #{c}"
end

case [1, [2, 3]]
in [a, b]
  # bには配列[2, 3]が代入される
  "a = #{a}, b = #{b}"
end

case [1, 999, 3]
in [1, n, 3]
  # 配列の要素数は3、かつ最初と最後の要素がそれぞれ1と3であればマッチ
  # 2番めの要素は任意で対応する値が変数ｎに代入される
  "n = #{n}"
end

case ['Alice', 999, 3]
in [String, 10..., n]
  # 配列の要素数は3、かつ最初の要素は文字列(String型)、かつ2番目の要素が10以上であればマッチ
  # 3番目の要素は任意で対応する値が変数nに代入される
  "n = #{n}"
end

# in節に同じ変数名を2回以上使うと構文エラーになる
case [1, 2, 3]
in [a, a, 3]
  # 省略
end

# 同じ値を同じ変数に代入しようとした場合も同様にエラーになる
case [1, 2, 3]
in [a, a, 3]
  # 省略
end

case [1, 2, 3]
in [_, _, 3]
  # 要素数が3つで最後の要素が3ならマッチ
  # 最初と2番目の要素は任意(_は変数として使わない)
  'matched'
end

# _の代わりに_aを使う(意味は上のコードと同じ)
case [1, 2, 3]
in [_a, _a, 3]
  'matched'
end

case [1, 2, 3, 4, 5]
in [1, *rest]
  # 最初の要素が1であればマッチ
  # 2番目以降の要素は任意(0個以上)で、対応する要素が配列として変数restに代入される
  "rest = #{rest}"
end

case [1, 2, 3, 4, 5]
in [1, *rest]
  # 最初の要素が1であればマッチ
  # 2番目以降の要素は任意(0個以上)で、対応する要素が配列として変数restに代入される
  "rest = #{rest}"
end

case [1, 2, 3, 4, 5]
in [1, ]
  'matched'
end

# in節の一番外側の[]は省略可能
case [1, [2, 3]]
in a, [b, c]
  "a = #{a}, b = #{b}, c = #{c}"
end

case {name: 'Alice', age: 20}
in {name: name, age: age}
  "name = #{name}, age = #{age}"
end

case {name: 'Alice', age: 20}
in {name:, age:}
  "name = #{name}, age = #{age}"
end

case {name: 'Alice', age: 20}
in {age:, name:}
  # キーの順番が一致しなくてもマッチの結果には影響しない
  "name = #{name}, aeg = #{age}"
end

case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', age: 18.., gender:}
  # :namen値がAlice、:ageの値が18以上かつ、キーに:genderが含まれればマッチ
  # :genderに対応する値は変数gendernい代入される
  "gender = #{gender}"
end

case {name: 'Alice', children: ['Bob']}
in {name:,children: [child]}
  # :nameと:childrenのキーを持ち、なおかつ:childrenの値が要素1個の配列であればマッチ
  "name = #{name}, child = #{child}"
end

case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', gender:}
  # in句に:ageを指定していないが、:nameと:genderの条件が部分一致するので全体としてはマッチ
  "gender = #{gender}"
end

cars = [
  {name: 'The Beatle', engine: '105ps'},
  {name: 'Prius', engine: '98ps', motor: '72ps'},
  {name: 'Tesla', motor: '306ps'}
]

cars.each do |car|
  case car
  in {name:, engine:}
    # The BeatleもPriusもどちらもこのパターンにマッチする
    puts "Gasoline: #{name} / engine: #{engine}"
  in {name:, motor:}
    puts "EV: #{name} / motor: #{motor}"
  in {name:, engine:, motor:}
    # Priusはガソリン車のパターンに部分一致するので下の処理は絶対に実行されない
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
  end
end

case {a: 1}
in {}
  #{a: 1}は空のハッシュではないのでここではマッチしない
  'empty'
in {a:}
  "a = #{a}"
end

case {}
in {}
  # 空のハッシュ同士で完全一致するのでここにマッチする
  'empty'
in {a:}
  "a = #{a}"
end

# in節でkey => value形式を使うと構文エラーになる
case {name: 'Alice', age: 20}
in {:name => n, age => a}
  # 省略
end

case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', **rest}
  # :nameがキーで値がAliceならマッチ。それ以外のキーと値は任意で変数restに代入
  "rest = #{rest}"
end

# **を最初に使うと構文エラーになる
case {name: 'Alice', age: 20, gender: :female}
in {**rest, gender:}
  # 省略
end

case {name: 'Alice', age: 20, gender: :female}
in {name: 'Alice', **}
  # :nameがキーで値がAliceならマッチ。それ以外のキーと値は任意(変数として使わない)
  # ただし、in {name: 'Alice'}と書いたときと違いがない
  'matched'
end

case {name: 'Alice', age: 20, gender: :female}
in {name:, **nil}
  # :name以外のキーがないことがマッチの条件になるので、case節のハッシュはマッチしない
end

case {name: 'Alice'}
in {name:, **nil}
  # :name以外のキーがないので、case節のハッシュはマッチする
  "name = #{name}"
end

# in節の一番外側の{}は省略可能
case {name: 'Alice', age: 20}
in age:, name:
  "name = #{name}, age = #{age}"
end

case {name: 'Alice', age: 20, gender: 'female'}
in {name: String, age: 18..}
  # マッチするが、:nameや:ageの値が取得できない!
end

case {name: 'Alice', age: 20, gender: 'famale'}
in {name: String => name, age: 18.. => age}
  # => 変数名の形式でマッチしたオブジェクトを変数に代入できる(asパターン)
  "name = #{name}, age = #{age}"
end

case {name: 'Alice', age: 20, gender: :female}
in {name: String, age: 18..} => person
  # マッチしたハッシュ全体を変数personに代入できる
  "person = #{person}"
end

