### 型推論をOCamlによって自作するリポジトリ

### 自作を決意した経緯

- 書籍、プログラミング言語の基礎概論の演習問題を解くにあたり、中盤移行の導出フローに手書き導出による困難を感じたため。
  - スニペットでは単純に実装が追いつかない

- 参考献立:
  - 「プログラミング in OCaml」
  - 「コンパイラ 作りながら学ぶ」
  - 「Goで作るインタプリタ」
  - 「プログラミングの基礎」

型推論までのおおまかなプロセス
---

 (参考: 「コンパイラ 作りながら学ぶ」)

|プロセス1|プロセス2|プロセス3|
|:---|:---:|---:|
|文字列読み込み|字句解析|構文解析|中間語作成|


実装編(ペアノ自然数)
---

(ペアノ自然数参考: 「プログラミング言語の基礎概念」)

- 文字列の読み込み

文字列を空白文字区切りでリストの作成をして、トークン解析する。この段階でペアノ自然数トークン・計算トークンの2つに切り分ける。この段階で、字句解析を呼び出す際の引数として、リストの要素化したトークンを字句解析に投げ込む準備が整う

- ペアノ自然数トークンの字句解析

ペアノ自然数として呼び込まれた文字列が、確かにペアノ自然数として成立しているかの判別を行う。解析段階で成立していないと判断される場合、適当に作成したエラーを出力して、文字列の入力修正を促す。

- 計算トークンの字句解析

計算トークンとして予め計算トークンのテーブルを作成しておく。実装は簡単な実装となっており、計算トークンとしていずれかの計算トークンと文字列が一致するかの比較を再帰関数として呼び込むことで実装した。
