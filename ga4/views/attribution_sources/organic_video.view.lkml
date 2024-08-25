view: organic_video {
  derived_table: {
    datagroup_trigger:attribution_channel
    sql: select 'blog.twitch.tv' as channel, 'Organic Video' as source UNION ALL
      select 'dailymotion.com' as channel, 'Organic Video' as source UNION ALL
      select 'help.netflix.com' as channel, 'Organic Video' as source UNION ALL
      select 'justin.tv' as channel, 'Organic Video' as source UNION ALL
      select 'player.vimeo.com' as channel, 'Organic Video' as source UNION ALL
      select 'vimeo' as channel, 'Organic Video' as source UNION ALL
      select 'crackle' as channel, 'Organic Video' as source UNION ALL
      select 'dashboard.twitch.tv' as channel, 'Organic Video' as source UNION ALL
      select 'hulu' as channel, 'Organic Video' as source UNION ALL
      select 'm.twitch.tv' as channel, 'Organic Video' as source UNION ALL
      select 'ted' as channel, 'Organic Video' as source UNION ALL
      select 'vimeo.com' as channel, 'Organic Video' as source UNION ALL
      select 'crackle.com' as channel, 'Organic Video' as source UNION ALL
      select 'disneyplus' as channel, 'Organic Video' as source UNION ALL
      select 'hulu.com' as channel, 'Organic Video' as source UNION ALL
      select 'm.youtube.com' as channel, 'Organic Video' as source UNION ALL
      select 'ted.com' as channel, 'Organic Video' as source UNION ALL
      select 'wistia' as channel, 'Organic Video' as source UNION ALL
      select 'curiositystream' as channel, 'Organic Video' as source UNION ALL
      select 'disneyplus.com' as channel, 'Organic Video' as source UNION ALL
      select 'id.twitch.tv' as channel, 'Organic Video' as source UNION ALL
      select 'music.youtube.com' as channel, 'Organic Video' as source UNION ALL
      select 'twitch' as channel, 'Organic Video' as source UNION ALL
      select 'wistia.com' as channel, 'Organic Video' as source UNION ALL
      select 'curiositystream.com' as channel, 'Organic Video' as source UNION ALL
      select 'fast.wistia.net' as channel, 'Organic Video' as source UNION ALL
      select 'iq.com' as channel, 'Organic Video' as source UNION ALL
      select 'netflix' as channel, 'Organic Video' as source UNION ALL
      select 'twitch.tv' as channel, 'Organic Video' as source UNION ALL
      select 'youku' as channel, 'Organic Video' as source UNION ALL
      select 'd.tube' as channel, 'Organic Video' as source UNION ALL
      select 'help.hulu.com' as channel, 'Organic Video' as source UNION ALL
      select 'iqiyi' as channel, 'Organic Video' as source UNION ALL
      select 'netflix.com' as channel, 'Organic Video' as source UNION ALL
      select 'utreon' as channel, 'Organic Video' as source UNION ALL
      select 'youku.com' as channel, 'Organic Video' as source UNION ALL
      select 'iqiyi.com' as channel, 'Organic Video' as source UNION ALL
      select 'player.twitch.tv' as channel, 'Organic Video' as source UNION ALL
      select 'utreon.com' as channel, 'Organic Video' as source UNION ALL
      select 'youtube' as channel, 'Organic Video' as source UNION ALL
      select 'dailymotion' as channel, 'Organic Video' as source UNION ALL
      select 'jobs.netflix.com' as channel, 'Organic Video' as source UNION ALL
      select 'veoh' as channel, 'Organic Video' as source UNION ALL
      select 'youtube.com' as channel, 'Organic Video' as source UNION ALL
      select 'veoh.com' as channel, 'Organic Video' as source UNION ALL
      select 'viadeo.journaldunet.com' as channel, 'Organic Video' as source ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  set: detail {
    fields: [
      channel,
      source
    ]
  }
}
