MARP := marp

.PHONY: new serve html pdf pptx check-deck

# 新規デッキ作成: make new NAME=my-talk [COLOR="#ff6362"]
new:
ifndef NAME
	$(error NAME を指定してください: make new NAME=my-talk [COLOR="\#ff6362"])
endif
	./new-slide.sh "$(NAME)" $(if $(COLOR),"$(COLOR)")

# 全体プレビューサーバ
serve:
	$(MARP) -s .

check-deck:
ifndef DECK
	$(error DECK を指定してください: make html DECK=my-talk)
endif

# ビルド: make html|pdf|pptx DECK=my-talk
html: check-deck
	$(MARP) "$(DECK)/index.md" -o "$(DECK)/index.html"

pdf: check-deck
	$(MARP) "$(DECK)/index.md" --pdf --allow-local-files -o "$(DECK)/index.pdf"

pptx: check-deck
	$(MARP) "$(DECK)/index.md" --pptx --allow-local-files -o "$(DECK)/index.pptx"
