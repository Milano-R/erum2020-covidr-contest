/* We do not want extra space below the galler-after footer */
$(document).ready(function () {
  $('body').has('.gallery-container').css({'cssText': 'padding-bottom: 0 !important'});
});

/* Make the top-level body container full-width and w/o padding */
$(document).ready(function () {
  $('body>.main-container').has('.gallery-container').css({'max-width': '100%', 'padding': '0'});
});

/* Responsive gallery container width for certain classes */
$(document).ready(function () {
  $('.gallery-embed-script, .gallery-embed-html').addClass('main-container container-fluid');
});


/* Set page-specific voting modal title and utterances script */
function set_vote_modal(title, repo, site, page_name) {

  /* clear utterances comments first to make sure there is no wrong voting */
  var modal_utterances = document.getElementById('vote-modal-utterances');
  modal_utterances.innerHTML = '';

  var modal_title = document.getElementById('vote-modal-title');
  modal_title.innerHTML = title;

  /* construct new utterances script to be executed */
  /* https://github.com/utterance/utterances/issues/82 */
  var script = document.createElement('script');
  script.src = 'https://utteranc.es/client.js';
  script.setAttribute('repo', repo);
  script.setAttribute('issue-term', site + "/" + page_name);
  script.setAttribute('label', ':+1:');
  script.setAttribute('theme', 'github-light');
  script.setAttribute('crossorigin', 'anonymous');
  script.setAttribute('async', 'async');
  modal_utterances.appendChild(script);

}

