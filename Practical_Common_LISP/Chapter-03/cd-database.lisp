;; Chapter 3 - Making a Simple Database
;; TODO: Cleaning the code with Macros

;; *db* is a global variable, it's good practice to
;; include global variable names between asterisks
(defvar *db* nil)


(defun make-cd (title artist rating ripped)
  "Creates a single record as a plist. A plist, or property list
    is a list where the odd elements start with a : symbol, and
    by using the function getf it's possible to retrieve the 
    following symbol in the list"
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd)
  " Adds a cd-record to the database"
  (push cd *db*))

(defun dump-db ()
  "Pretty prints the database using format's parameters"
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

(defun prompt-read (prompt)
  "Takes a prompt string, prints it and
    waits for the answer. 'force-output is just
    used for making sure the function does't
    wait for a newline before printing the prompt,
    it's implementation dependent"
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  "Asks for the parameters of a cd-record. 
    The function prompt-read is appropriate when the
    user's input is a string, but in case of a number (int)
    we need to process the input through the function parse-integer
    and we also add the the optional keyword junk-allowed to prevent
    parse-integer from generating errors in case it can't parse the value;
    in that case we decide to use zero as a default value.
    In regards to the ripped parameter, we use the built-in function
    y-or-n-p which is suitable for boolean values, it also keep requesting
    a valid answer until satisfied."
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t)
        0)
   (y-or-n-p "Ripped [y/n]")))

(defun add-cds ()
  "Adds cd records to the database"
  (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Another? [y/n]: "))
            (return))))

(defun save-db (filename)
  "Saves the database to a file. 
    The variable 'out' holds the file stream. The macro 
    with-standard-io-syntax  ensures that certain variables that
    affect the behaviour of print are set to their std values.
    Print prints lisp objects that can be read back by the Lisp reader" 
  (with-open-file (out filename
                       :direction :output
                       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  "Reads the content of the file into the *db* variable
    so its elements can be accessed and used"
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun select-by-artist (artist)
  "Lists the cds associated with the given artist"
  (remove-if-not
   #'(lambda (cd) (equal (getf cd :artist) artist))
   *db*))

(defun select (selector-fn)
  "Lists the cds by passing the content type of interest.
    The type passed needs to be a lambda function. 
    Used by passing one of the specific selectors like
    artist-selector"
  (remove-if-not selector-fn *db*))

(defun artist-selector (artist)
  #'(lambda (cd) (equal (getf cd :artist) artist)))

(defun where (&key title artist rating (ripped nil ripped-p))
  "Generic selector for querying the database, to be passed to
    the function 'select'"
  #'(lambda (cd)
      (and
       (if title    (equal (getf cd :title)  title)  t)
       (if artist   (equal (getf cd :artist) artist) t)
       (if rating   (equal (getf cd :rating) rating) t)
       (if ripped-p (equal (getf cd :ripped) ripped) t))))

(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  "Updates the records of the database"
  (setf *db*
        (mapcar
         #'(lambda (row)
             (when (funcall selector-fn row)
               (if title (setf (getf row :title) title))
               (if artist (setf (getf row :artist) artist))
               (if rating (setf (getf row :rating) rating))
               (if ripped-p (setf (getf row :ripped) ripped)))
             row) *db*)))
