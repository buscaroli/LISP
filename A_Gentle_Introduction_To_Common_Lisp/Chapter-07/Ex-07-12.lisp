(defun is-the (word)
  "Returns true if the word is equal to 'the'
    otherwise returns NIL"
  (equal 'the word))

(defun count-the (phrase)
  "Returns the occurencies of the word 'the'
    in the given phrase"
  (length  (remove-if-not #'is-the phrase)))
