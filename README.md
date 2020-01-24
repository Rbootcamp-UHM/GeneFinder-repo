# HW4: The making of GENE FINDER
## String Matching, More Index/Subsetting Practice, Bioinformatics, and Input/Output
## A collaborative project
## Due no later than midnight, Friday Jan 31 (decide as a team)

# R Task 

1. Clone and create your own branch off of `GeneFinder-repo`(instructions below if you need). The code we developed in class is in
   ```
   genefinder_inclass012320.R  
   ```
2. We want to find all potential coding regions in a given DNA sequence. To make sure it will work on any sequence, we will use randomly generated DNA. 

## **Background**
Coding regions begin with a start codon and end with a stop codon. Furthermore, since DNA is read in **triplets**, in order to define a coding region the start codon and the stop codon must be in the same frame to be an open reading frame. For example, there are three related sequences below that are written by triplets in frame 1, frame 2, and frame 3.  All of the sequences contain a start codon `ATG` in frame 1, and stop codons `TAA` in frames 1, 2, and 3, respectively. You can see that when the DNA is read in triplets, only the first has an open reading frame because start and stop are in the same frame:

```
1. Frame 1: ...A ATG TCT AAA ATG GGT TAA GCC...
2. Frame 2: ...AA TGT CTA AAA TGG GTT TAA CC...
3. Frame 3: ...AAT GTC TAA AAT GGG TTA TAA C...
```

In order to find a potential gene, we want to find the longest open reading frame. To do this, we need to find all open reading frames in the six frames (3 forward and 3 reverse). 

## **The Data**

Make up random DNA sequence data. Make a vector of 500  base pairs sampled at random. In this DNA ``data'' we want to find all possible coding regions. We are going to assume that there are no introns. 

## **The Problem**
You recall from Molecular Biology class that coding regions are marked with a start and a stop codon. 

The start codon is `ATG`. 
There are three stop codons: *amber* (`TAG`), *ochre* (`TAA`), and *opal* or *umber* (`TGA`). 


## **The Task**

Working in a team with your classmates, start by flowcharting or outlining the tasks. Just as we did in class, break each steps down further into concrete (and simple) programming steps. Some things to keep in mind:

* Make up a random DNA sequence, you should save it as a `.csv` file to work on the same input for debugging purposes.
* How do you find the start codon? Can you apply the same process to finding any other codon? 
* What should be a function?
* Start and stop codons must be in the same reading frame. How do you figure out which start and stop codons are in the same frame? 
* Find all start and stop codons -- manually check that they are actually correct.
* When reading DNA in the opposite direction you must not only reverse but also take the complement (the reverse complement). 
* Find all of the possible open reading frames. Write output to a text file using the `cat()` function which prints the following information for each open reading frame on separate lines: orf number, start position, stop position, and the sequence (
`orf1 start:xx stop:xx sequence:ATGAGGTC.....TAA`), and tell us which one is the longest ORF.  Call this file `genefinder_orf.txt`.  *Make sure you include the complete stop codon (all 3 base pairs) in the output*.  Keep the numbering simple, tell us the positions in the direction of reading the DNA coding region.  
* Also print to screen:  the longest ORF (the sequence),  which frame it's in, and start and stop position along the original DNA sequence.*
* Start brainstorming with your team, and develop a plan for the needed functions, and how they will interact (what calls what, what are the inputs/outputs of each), and who will code what. 
	* *Brainstorm:* Toss ideas around in person, or use our Slack Channel: (http://rbootcamp-uhm.slack.com) 
	* *Organize:* Use the Project Planning Board for GeneFinder-repo under the "Projects" tab above (https://github.com/Rbootcamp-UHM/GeneFinder-repo/projects). 
* Each person should contribute a function or a part of the overall code that is contributed to GeneFinder-repo. You can save your functions in separate `.R` scripts, but you will want to have one main stript that demonstrates their use as well as an accompanying Rmarkdown and html files. 
* As you work through development, when you are ready for your team members to review your code, generate a pull request. After receiving comments, fix the code and resolve all issues. When you are confinced that itʻs working, merge back to master.
* In the scripts and the markdown, please credit each author (in comments in .R, and maybe a list of respective contributions in the markdown). 



# Submission
 
Write up and push back up to GitHub:
	1. R scripts (.R) that contains your working functions
	2. Rmarkdown and html files that introduces your new GeneFinder to the world.  Be sure to explain its essential elements and include examples of its use.
	

---
# Helpful Notes on Rmarkdown and Git/GitHub
---

# Rmarkdown

[Rmarkdown basics](https://rmarkdown.rstudio.com/authoring_basics.html)

# Generating html with Rmarkdown

From within R (make sure the .Rmd file is in your R working directory): 
   ```{r}
   require(rmarkdown)
   
   render("markdown_example.Rmd", output_format="html_document") # to html
   # render("markdown_example.Rmd", output_format="word_document")  # to word doc
   # render("markdown_example.Rmd", output_format="pdf_document")  # to pdf
   # render("markdown_example.Rmd", output_format="md_document")  # to markdown
   ```

# Working with GitHub:

Cloning the repository. From your Rclass directory in your CMD or Terminal window:
   ```
    git clone https://github.com/Rbootcamp-UHM/GeneFinder-repo.git
   ```
Check the status of your branches:
   ```
   git branch 
   ```
Making your own branch (give it your own name) and check it out (this means Git will start tracking the branch):
   ```
   git branch my-awesome-branch
   git checkout my-awesome-branch
   ```

## Pushing your new files or changes back up to the repository. 

Check status first:
   ```
   git status
   ```
You should get a message that you have changes not staged for commit on your branch. 
Add the new files on the docket to push up to your branch on github:
   ```
   git add myscript.R    
   ```
Write a commit message:
   ```
   git commit -m "Add script to do xx"
   ```
Finally push up the changes to **your own branch**. Donʻt worry it will not change the "master":
   ```
   git push origin my-awesome-branch
   ```
Every time you made edits you have to do all three:
   ```
   git add myscript.R    
   git commit -m "edits to myscript.R"
   git push origin my-awesome-branch
   ```

## If any files in your branch have been changed on the server (through the browser or someone else changed them), you will need to update your local branch before pushing your new files up to the repository:

Check the status of your branch (and confirm which one youʻre on):
   ```
   git branch 
   ```
If you have new changes on the remote my-awesome-branch and need to update your local files:
    ```
    git pull origin my-awesome-branch
    ```
Check if all is up to date:
   ```
   git status
   ```
   
If everyting is up to date it will say `Your branch is up-to-date with 'origin/master'. nothing to commit, working tree clean`

## Browsing branches

List all branches. Checkout a cool looking branch. Check which branch youʻre on:
   ```
   git branch -a
   git checkout someones-cool-branch
   git branch
   ```
To go back to your own branch, or to master:
   ```
   git checkout my-awesome-branch
   git branch
   git checkout master
   git branch
   ```


## Submission

Generate a pull request to submit your branch for review. Do this on the GitHub website.

Provide comments (at least 2) on your classmates work. Do this through the GitHub website. They have a very nice interface. 
- Click on `Pull requests` along the upper menu
- Click on one of the pull requests (branches)
- Click on `Files changed` along the second upper menu
- Highlight the rows you want to comment on
- You can checkout their branch to run the code or markdown on your own computer

[Video tutorial on how to comment on other peopleʻs code in a Pull Request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/reviewing-proposed-changes-in-a-pull-request)



