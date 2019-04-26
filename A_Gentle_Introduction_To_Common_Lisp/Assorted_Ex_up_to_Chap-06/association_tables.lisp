;; things is a variable containing a list of objects
;; organised to have the car of the list as the name
;; and the cdr as a list of properties
(defvar things)
(setf things
      '((object1 large green shiny cube)
        (object2 small red dull metal cube)
        (object3 red small dull plastic cube)
        (object4 small dull blue metal cube)
        (object5 small shiny red four-sided pyramid)
        (object6 large shiny green sphere)))

(defun description (item)
  "Returns the description of the object in the form
    of a list"
  (cdr (assoc item things)))

(defun differences (item1 item2)
  "Given two objects it returns a list of the 
    type of properties not in common"
  (set-exclusive-or (description item1)
                    (description item2)))

;; Association table that associates every description
;; in the table 'things' to a corresponding property type
(defvar quality-table)
(setf quality-table
      '((large   . size)
        (small   . size)
        (red     . colour)
        (green   . colour)
        (blue    . colour)
        (shiny   . luster)
        (dull    . luster)
        (metal   . material)
        (plastic . material)
        (cube    . shape)
        (sphere  . shape)
        (pyramid . shape)
        (four-sided . shape)))

(defun quality (x)
  "Helper function that given a property returns
    the type of the property. 
    e.g. given 'cube returns 'shape
         given 'red  returns 'colour"
  (cdr (assoc x quality-table)))

(defun quality-differences (item1 item2)
  "Given two objects it returns a list of the properties
    they don't have in common."
  (remove-duplicates (mapcar #'quality (differences item1 item2))))
