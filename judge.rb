# ビンゴシート ---> bingo_sheet
S = gets.to_i
bingo_sheet = Array.new(S){ gets.split(nil) }
# ビンゴリスト ---> bingo_list   (*1_適合要素位置 を確認する際に使用)
bingo_list  = bingo_sheet.flatten

# 判定ワード群 ---> judge_words
N = gets.to_i
judge_words = Array.new(N){ gets.chomp }
# 判定リスト ---> judge_list   (*2_適合要素位置 に 判定値"true" を入れる際に使用)
judge_list = Array.new(S*S)
# 判定ワード ---> judge
judge_words.each do |judge|
  # 適合要素位置 ---> position
  if position = bingo_list.find_index(judge)   #(*1)
    judge_list[position] = true   #(*2)
  end
end

# 判定シート ---> judge_sheet   (*3_二次元配列を 判定結果 に使用)
judge_sheet = judge_list.each_slice(S).to_a

# 横判定結果 ---> row
row = judge_sheet.any?(& :all?)   #(*3)
# 縦判定結果 ---> column
column = judge_sheet.transpose.any?(& :all?)   #(*3)
# 斜め判定結果 ---> diagonal
diagonal1 = Array.new(S){|i| judge_sheet[i][i] }.all?   #(*3)
diagonal2 = Array.new(S){|i| judge_sheet[i][-i-1] }.all?   #(*3)

# 最終結果
if row || column || diagonal1 || diagonal2
  puts "yes"
else
  puts "no"
end
