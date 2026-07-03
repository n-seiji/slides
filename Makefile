MARP := marp

.PHONY: new serve html pdf pptx preview check check-deck

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

# スライドを 1 枚ずつ PNG に出力(視覚確認用・コミットしない)
# 出力先: <DECK>/.preview/slide.001.png ...
preview: check-deck
	rm -rf "$(DECK)/.preview"
	$(MARP) "$(DECK)/index.md" --images png --allow-local-files -o "$(DECK)/.preview/slide.png"
	@echo "出力: $(DECK)/.preview/"

# 全デッキ + テンプレートがビルドできるか確認
check:
	@for d in */index.md; do \
		$(MARP) "$$d" -o /dev/null 2>/dev/null && echo "OK  $$d" || { echo "NG  $$d"; exit 1; }; \
	done
