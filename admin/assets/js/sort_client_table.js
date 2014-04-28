function client_sort_table(id,id2,col,rev) {
	var elem;
	if(document.getElementById) {
		var elem = document.getElementById(id);
	} else if (document.all){
		var elem = document.all[id];
	}

	//return true descending false ascending
	rev = sortTable(id2,col,rev);
	//elem.className = "sortable-desc";
	for (i = 0; i < elem.rows[0].cells.length-1 ; i++) {
		if (i==col) {
			if (rev) elem.rows[0].cells[i].className = "sorting_desc";
			else elem.rows[0].cells[i].className = "sorting_asc";
		} else elem.rows[0].cells[i].className = "sorting";	
	}
}
//-----------------------------------------------------------------------------
// sortTable(id, col, rev)
//
//  id  - ID of the TABLE, TBODY, THEAD or TFOOT element to be sorted.
//  col - Index of the column to sort, 0 = first column, 1 = second column,
//        etc.
//  rev - If true, the column is sorted in reverse (descending) order
//        initially.
//
// Note: the team name column (index 1) is used as a secondary sort column and
// always sorted in ascending order.
//-----------------------------------------------------------------------------

function sortTable(id, col, rev) {

	// Get the table or table section to sort.
	//var tblEl = document.getElementById(id);
	var tblEl;
	if(document.getElementById) {
		var tblEl = document.getElementById(id);
	} else if (document.all){
		var tblEl = document.all[id];
	}
	
	// The first time this function is called for a given table, set up an
	// array of reverse sort flags.
	if (tblEl.reverseSort == null) {
		tblEl.reverseSort = new Array();
		// Also, assume the team name column is initially sorted.
		tblEl.lastColumn = 1;
	}

	// If this column has not been sorted before, set the initial sort direction.
	if (tblEl.reverseSort[col] == null)
		tblEl.reverseSort[col] = rev;

	// If this column was the last one sorted, reverse its sort direction.
	if (col == tblEl.lastColumn)
		tblEl.reverseSort[col] = !tblEl.reverseSort[col];

	// Remember this column as the last one sorted.
	tblEl.lastColumn = col;

	// Set the table display style to "none" - necessary for Netscape 6 
	// browsers.
	var oldDsply = tblEl.style.display;
	tblEl.style.display = "none";

	// Sort the rows based on the content of the specified column using a
	// selection sort.
	var tmpEl;
	var i, j;
	var minVal, minIdx;
	var testVal;
	var cmp;

	for (i = 0; i < tblEl.rows.length - 1; i++) {
		// Assume the current row has the minimum value.
		minIdx = i;
		minVal = getTextValue(tblEl.rows[i].cells[col]);

		// Search the rows that follow the current one for a smaller value.
		for (j = i + 1; j < tblEl.rows.length; j++) {
			testVal = getTextValue(tblEl.rows[j].cells[col]);
			
			cmp = compareValues(minVal, testVal);
			// Negate the comparison result if the reverse sort flag is set.
			if (tblEl.reverseSort[col])
				cmp = -cmp;
			// Sort by the second column (team name) if those values are equal.
			if (cmp == 0 && col != 1)
				cmp = compareValues(getTextValue(tblEl.rows[minIdx].cells[1]), getTextValue(tblEl.rows[j].cells[1]));
			// If this row has a smaller value than the current minimum, remember its
			// position and update the current minimum value.
			if (cmp > 0) {
				minIdx = j;
				minVal = testVal;
			}
		}

		// By now, we have the row with the smallest value. Remove it from the
		// table and insert it before the current row.
		if (minIdx > i) {
			tmpEl = tblEl.removeChild(tblEl.rows[minIdx]);
			tblEl.insertBefore(tmpEl, tblEl.rows[i]);
		}
	}
	// Restore the table's display style.
	tblEl.style.display = oldDsply;

	return tblEl.reverseSort[col];
}

//-----------------------------------------------------------------------------
// Functions to get and compare values during a sort.
//-----------------------------------------------------------------------------

// This code is necessary for browsers that don't reflect the DOM constants
// (like IE).
if (document.ELEMENT_NODE == null) {
	document.ELEMENT_NODE = 1;
	document.TEXT_NODE = 3;
}

function getTextValue(el) {
	var i;
	var s;

	// Find and concatenate the values of all text nodes contained within the
	// element.
	s = "";
	for (i = 0; i < el.childNodes.length; i++) {
		if (el.childNodes[i].nodeType == document.TEXT_NODE) {
			s += el.childNodes[i].nodeValue;
		} else if (el.childNodes[i].nodeType == document.ELEMENT_NODE && el.childNodes[i].tagName == "BR") {
			s += " ";
		} else {
			// Use recursion to get text within sub-elements.
			s += getTextValue(el.childNodes[i]);
		}
	}
	return normalizeString(s);
}

function setDataType(cValue) {
	// THIS FUNCTION CONVERTS DATES AND NUMBERS 
	// SORTING WHEN IN THE SORT FUNCTION
	var isDate = new Date(cValue);
	
	if (isDate == "NaN" || isDate == "Invalid Date") {
		if (isNaN(cValue)) {
			// THE VALUE IS A STRING, MAKE ALL CHARACTERS IN
			// STRING UPPER CASE TO ASSURE PROPER A-Z SORT
			cValue = cValue.toUpperCase();
			return cValue;
		} else {
			// VALUE IS A NUMBER, TO PREVENT STRING SORTING OF A NUMBER
			// ADD AN ADDITIONAL DIGIT THAT IS THE + TO THE LENGTH OF
			// THE NUMBER WHEN IT IS A STRING
			var myNum;
			myNum = String.fromCharCode(48 + cValue.length) + cValue;
			return myNum;
		}
	} else {
		if (!isNaN(cValue)) {
			// VALUE IS A NUMBER, TO PREVENT STRING SORTING OF A NUMBER
			// ADD AN ADDITIONAL DIGIT THAT IS THE + TO THE LENGTH OF
			// THE NUMBER WHEN IT IS A STRING
			var myNum;
			myNum = String.fromCharCode(48 + cValue.length) + cValue;
			return myNum;
		}
		
		// VALUE TO SORT IS A DATE, REMOVE ALL OF THE PUNCTUATION AND
		// AND RETURN THE STRING NUMBER
		//BUG - STRING AND NOT NUMERICAL SORT .....
		// ( 1 - 10 - 11 - 2 - 3 - 4 - 41 - 5  etc.)
		var myDate = new String();
		myDate = isDate.getFullYear() + " " ;
		myDate = myDate + isDate.getMonth() + " ";
		myDate = myDate + isDate.getDate(); + " ";
		myDate = myDate + isDate.getHours(); + " ";
		myDate = myDate + isDate.getMinutes(); + " ";
		myDate = myDate + isDate.getSeconds();
		//myDate = String.fromCharCode(48 + myDate.length) + myDate;
		
		return myDate ;
	}
}

function compareValues(v1, v2) {
	var f1, f2;

	// If the values are numeric, convert them to floats.

	//f1 = parseFloat(v1);
	//f2 = parseFloat(v2);
  
	f1 = setDataType(v1);
	f2 = setDataType(v2);
	if (!isNaN(f1) && !isNaN(f2)) {
		v1 = f1;
		v2 = f2;
	}

	// Compare the two values.
	if (v1 == v2) return 0;
	if (v1 > v2) return 1
	return -1;
}

// Regular expressions for normalizing white space.
var whtSpEnds = new RegExp("^\\s*|\\s*$", "g");
var whtSpMult = new RegExp("\\s\\s+", "g");

function normalizeString(s) {
	s = s.replace(whtSpMult, " ");  // Collapse any multiple whites space.
	s = s.replace(whtSpEnds, "");   // Remove leading or trailing white space.

	return s;
}
