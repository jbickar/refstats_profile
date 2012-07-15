<?php

/*
 * Implementation of hook_install_tasks().
 */

function refstats_profile_install_tasks($install_state) {
  $tasks['refstats_profile_tasks'] = array(
    'display_name' => st('Do configuration tasks for the Reference Statistics installation profile'),
    'display' => FALSE,
    'type' => 'normal',
    'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
  );

  return $tasks;
}

function refstats_profile_tasks() {
  //set up themes
  $preferred_themes = array(
    'theme_default' => 'ref',
    'bartik'
  );
  theme_enable($preferred_themes);
  foreach ($preferred_themes as $var => $theme) {
    if (!is_numeric($var)) {
      variable_set($var, $theme);
    }
  }
}
