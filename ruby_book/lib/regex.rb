old_syntax = <<TEXT
{
  :name => 'Alice',
  :age => 20,
  :gender =>'female'
}
TEXT

convert_hash_syntax(old_syntax)

text = <<TEXT
I love ruby.
Python is a greate language.
Java and JavaScript are different.
TEXT

text.scan(/[A-Z][A-Za-z]+/)

text = <<TEXT
私の郵便番号は123-4567です。
僕の住所は677-0056兵庫県西脇市板波町1234だよ。
TEXT

puts text.gsub(/(\d{3})(\d{4)/){ "#{$1}-#{$2}" }

def hello(name)
  puts "Hello, #{name}!"
end

hello('Alice')

hello('Bob')

hello('Carol')

r = /\d{3}-\d{4}/
r.class

# マッチした場合は最初にマッチした文字列の開始位置が返る(つまり真)
'123-4567' =~ /\d{3}-\d{4}/

# マッチしない場合はnilが返る
'hello' =~ /\d{3}-\d{4}/

# if文で=~を使うとマッチしたかどうかを判別できる
if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end

# 左辺に正規表現を置いても結果は同じ
/\d{3}-\d{4}/ =~ '123-4567'
/\d{3}-\d{4}/ =~ 'hello'

# マッチしなければtrue
'hello' !~ /\d{3}-\d{4}/

# マッチすればfalse
'123-4567' !~ /\d{3}-\d{4}/

text = '私の誕生日は1999年1月1日です。'
m = /(\d+)年(\d+)月(\d+)/.match(text)
m[1]
m[2]
m[3]

text = '私の誕生日は1999年1月1日です。'
/(\d+)年(\d+)月(\d+)/.match(text)
/(\d+)年(\d+)月(\d+)/.match(foo)

text = '私の誕生日は1999年1月1日です。'
# 真偽値の判定とローカル変数への代入を同時にやってしまう
if m = /(\d+)年(\d+)月(\d)日/.match(text)
  # マッチした場合の処理(ローカル変数のmを使う)
  puts m
else
  # マッチしなかった場合の処理
end

text = '私の誕生日は1999年1月1日です。'
m = /(\d+)年(\d+)月(\d)日/.match(text) 
# マッチした部分全体を取得する
m[0]
# キャプチャの1番目を取得する
m[1]
# キャプチャの2番目から2個取得する
m[2, 2]
# 最後キャプチャを取得する
m[-1]
# Rangeを使って取得する
m[1..3]

text = '私の誕生日は1999年1月1日です。'
m = text.match(/(\d+)年(\d+)月(\d)日/)

# キャプチャに(?<name>)というメタ文字で名前をつけることができる
(?<year>\d+)年(?< month > \d+)月(?< day > \d+)日

text = '私の誕生日は1999年1月1日です。'
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
# シンボルで名前を指定してキャプチャの結果を取得する
m[:year]
m[:month]
m[:day]

# 文字列で指定することもできる
m['year']
# 連番で指定することもできる
m[2]

text = '私の誕生日は1999年1月1日です。'
# キャプチャした名前がそのままローカル変数に割り当てられる
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end

text = '私の誕生日は1999年1月1日です。'

# =~やmatchメソッドを使うとマッチした結果が組み込み変数に代入される
text =~ /(\d+)年(\d+)月(\d+)日/

# MatchDataオブジェクトを取得する
$~ #=> #<MatchData "1999年1月1日" 1:"1999" 2:"1" 3:"1">

# マッチした部分全体を取得する
$& #=> "1999年1月1日"

# 1番目〜3番目のキャプチャを取得する
$1
$2
$3

# 最後のキャプチャを取得する
$+

'123 456 789'.scan(/\d+/)

'1977年7月17日 2021年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)

'1977年7月17日 2021年12月31日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)
# ↓簡潔な表現
'1977年7月17日 2021年12月31日'.scan(/\d+年\d+月\d+日/)


# []に正規表現を渡すと文字列からマッチした部分を抜き出す
text = '郵便番号は123-4567です'
text[/\d{3}-\d{4}/]

# マッチした部分が複数ある場合は最初にマッチした文字列を返す
text = '123-4567 456-7890'
text[/\d{3}-\d{4}/]

text = '誕生日は1977年7月17日です'

# 第2引数がないとマッチした部分全体が返る
text[/(\d+)年(\d+)月(\d+)日/]

# 第2引数を指定して3番めのキャプチャを取得する
text[/(\d+)年(\d+)月(\d+)日/, 3]

text = '誕生日は1977年7月17日です'

# シンボルでキャプチャの名前を指定する
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :day]

# 文字列でキャプチャの名前を指定する
text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day']

text = '郵便番号は123-4567です'
text.slice(/\d{3}-\d{4}/)

text = '誕生日は1977年7月17日です'
text.slice(/(\d+)年(\d+)月(\d+)日/, 3)

#slice!にするとマッチした部分が文字列から破壊的に取り除かれる
text = '郵便番号は123-4567です'
text.slice!(/\d{3}-\d{4}/)

text = '123, 456-789'

# 文字列で区切り文字を指定する
text.split(',')

# 正規表現を使ってカンマまたはハイフンを区切り文字に指定する
text.split(/,|-/)

text = '123,456-789'

# 第1引数に文字列を渡すと、完全一致する文字列を第2引数で置き換える
text.gsub(',','.')
# 正規表現を渡すと、マッチした部分を第2引数で置き換える
text.gsub(/,|-/,':')

text = '123, 456-789'
# カンマはコロンに、ハイフンはスラッシュに置き換える
has = {',' => ':', '-' => '/'}
text.gsub(/,|-/, hash)

text = '123, 456-789'
# カンマはコロンに、それ以外はスラッシュに置き換える
text.gsub(/,|-/){ |matched| matched == ',' ? ':' : '/' }

text = '123, 456-789'
text.gsub!(/,|-/, ':')
text

text = '誕生日は1977年7月17日です'
text.gsub(/(\d+)年(\d+)月(\d+)日/, '\1-\2-\3')

# ダブルクオートで囲む場合は、\\1のようにバックスラッシュを2つ重ねる
text.gsub(/(\d+)年(\d+)月(\d+)日/, "\\1-\\2-\\3")

# 第2引数の代わりにブロックを使うと、バックスラッシュをどうエスケープするか迷わずに済む
# キャプチャした文字列は$1や$2で参照でき、ブロックの戻り値が置き換え後の文字列に
text.gsub(/(\d+)年(\d+)月(\d+)日/) do
  "#{$1}-#{$2}-#{$3}"
end

text = '誕生日は1977年7月17日です'
text.gsub(
  /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,
  '\k<year>-\k<month>-\k<day>'
)

text.gsub(/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/) do
  "#{$~[:year]}-#{$~[:month]}-#{$~[:day]}"
end

# /\d{3}-\d{4}と書いたのと同じ
Regexp.new('\d{3}-\d{4}')

# スラッシュで囲むと、スラッシュをエスケープする必要がある
/https:\/\/example\.com/

# %rを使うとスラッシュをエスケープしなくて良い
%r!https://example\.com!

# !ではなく{}を区切り文字にする
%r{https://example\.com}

pattem = '\d{3}-\d{4}'
# 変数が展開されるので/\d{3}-\d{4}/と書いたことと同じになる
'123-4567' =~ /#{pattem}/

text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end

$& #=> "03-1234-5678"
$~ #=> #<MatchData "03-1234-5678">

# iオプションを付けると大文字小文字を区別しない
'HELLO' =~ /hello/i

# %rを使った場合も最後にオプションを付けられる
'HELLO' =~ %r{hello}i

regexp = Regexp.new('hello', Regexp::IGNORECASE)
'HELLO' =~ regexp

# mオプションがないと.は改行文字にマッチしない
"HELLO\nBye" =~ /Hello.Bye/

# mオプションを付けると.が改行文字にもマッチする
"Hello\nBye" =~ /Hello.Bye/m

regexp = Regexp.new('Hello.Bye', Regexp::MULTILINE)
"Hello\nBye" =~ regexp

regexp = /
  \d{3} # 郵便番号の先頭3桁
  -  # 区切り文字のハイフン
  \d{4} # 郵便番号の末尾4桁
/x
'123-4567' =~ regexp

regexp = /
  \d{3}
  \  # 半角スペースで区切る
  \d{4}
/x
'123 4567' =~ regexp

# バックスラッシュを特別扱いしないように'TEXT'を使う

pattern = <<'TEXT'
  \d{3} #郵便番号の先頭3桁
  - #区切り文字のハイフン
  \d{4} #郵便番号の末尾4桁
TEXT
regexp = Regexp.new(pattern, Regexp::EXTENDED)
'123-4567' =~ regexp

# iオプションとmオプションを同時に使う
"HELLO\nBYE" =~ /Hello.Bye/im

regexp = Regexp.new('Hello.Bye', Regexp::IGNORECASE | Regexp::MULTILINE)
"HELLO\nBYE" =~ /Hello.Bye/im

text = '私の誕生日は1977年7月17日です'

# =~ 演算子などを使うと、マッチした結果をRegexp.last_matchで取得できる
text =~ /(\d+)年(\d+)月(\d+)日/

# MatchDataオブジェクト
Regexp.last_match

# マッチした部分全体を取得する
Regexp.last_match(0)

# 1~3番目のキャプチャを取得する
Regexp.last_match(1)
Regexp.last_match(2)
Regexp.last_match(3)

# 最後のキャプチャ文字列を取得する
Regexp.last_match(-1)

# マッチすればtrueを返す
/\d{3}-\d{4}/.match?('123-4567')

# マッチしても組み込み変数やRegexp.last_matchを書き換えない
$~
Regexp.last_match

# 文字列と正規表現を入れ替えてもOK
'123-4567'.match?(/\d{3}-\d{4}/)