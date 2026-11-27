# Question 2: Verb Recognition  

## 1. Objective
The goal of `recognize_verbs.l` is to scan input text and recognize the 20 specified English verbs (`is`, `am`, `are`, `were`, `was`, `be`, `being`, `been`, `do`, `does`, `did`, `will`, `would`, `should`, `can`, `could`, `has`, `have`, `had`, `go`) as complete words while rejecting non-verbs and words that merely contain a target verb as a substring.

## 2. Regular Expressions & Pattern Matching
* **Target Verb Pattern:**
  `is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go`
  * Uses the alternation operator (`|`) to match any one of the 20 exact character sequences.
  * When matched, LEX stores the string in `yytext` and prints `Verb recognized: <yytext>`.
* **General Word Fallback Pattern:**
  `[a-zA-Z]+`
  * Matches any contiguous sequence of one or more uppercase or lowercase English letters that did not match the verb rule above, printing `Not a target verb: <yytext>`.
* **Whitespace & Punctuation Handling:**
  `[ \t\r\n]+` and `.`
  * Silently consumes spaces, tabs, newlines, digits, and punctuation so tokens are cleanly isolated without cluttering the output.

## 3. How Complete-Word Matching Is Enforced
LEX resolves rule conflicts using two core principles:
1. **Longest-Match Principle:** LEX always consumes the longest possible string matching any rule. For example, given the word `"island"`, the `[a-zA-Z]+` rule matches all 6 characters (`"island"`), whereas the verb rule only matches the first 2 characters (`"is"`). Because 6 > 2, LEX chooses `[a-zA-Z]+` and classifies `"island"` as not a target verb. The same applies to `"going"` vs. `"go"`, `"cane"` vs. `"can"`, and `"artist"` vs. `"are"`.
2. **Rule Priority (Top-to-Bottom Ordering):** When an input token is an exact verb like `"is"`, both the verb rule and `[a-zA-Z]+` match the same length (2 characters). Because the verb rule is placed first in the specification file, LEX gives it higher priority and recognizes it as a target verb.