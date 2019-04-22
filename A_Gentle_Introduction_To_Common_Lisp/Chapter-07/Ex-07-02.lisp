(defvar daily-planet)
(setf daily-planet
      '((olsen jimmy 123-76-4535 cub-reporter)
        (kent  clark 089-52-6787 reporter)
        (lane  lois  951-26-1438 reporter)
        (white perry 355-16-7439 editor)))

(defun get-ssn (records)
  "Gets the social security numbers from a 
    given list"
  (mapcar #'third records))
