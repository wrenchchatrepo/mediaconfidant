view: organic_shopping {
  derived_table: {
    datagroup_trigger:attribution_channel
    sql: select 'Google Shopping' as channel,  'Organic Shopping'as source  UNION ALL
      select 'alibaba.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'cr.shopping.naver.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'etsy' as channel,  'Organic Shopping'as source  UNION ALL
      select 'mercadolibre.com.mx' as channel,  'Organic Shopping'as source  UNION ALL
      select 'one.walmart.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shopify.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'store.shopping.yahoo.co.jp' as channel,  'Organic Shopping'as source  UNION ALL
      select 'IGShopping' as channel,  'Organic Shopping'as source  UNION ALL
      select 'amazon' as channel,  'Organic Shopping'as source  UNION ALL
      select 'cr2.shopping.naver.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'etsy.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'message.alibaba.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'order.shopping.yahoo.co.jp' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shopping.naver.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'stripe' as channel,  'Organic Shopping'as source  UNION ALL
      select 'aax-us-east.amazon-adsystem.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'amazon.co.uk' as channel,  'Organic Shopping'as source  UNION ALL
      select 'ebay' as channel,  'Organic Shopping'as source  UNION ALL
      select 'm.alibaba.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'msearch.shopping.naver.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'partners.shopify.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shopping.yahoo.co.jp' as channel,  'Organic Shopping'as source  UNION ALL
      select 'stripe.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'aax.amazon-adsystem.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'amazon.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'ebay.co.uk' as channel,  'Organic Shopping'as source  UNION ALL
      select 'm.shopping.naver.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'nl.shopping.net' as channel,  'Organic Shopping'as source  UNION ALL
      select 's3.amazonaws.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shopping.yahoo.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'uk.shopping.net' as channel,  'Organic Shopping'as source  UNION ALL
      select 'alibaba' as channel,  'Organic Shopping'as source  UNION ALL
      select 'apps.shopify.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'ebay.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'mercadolibre' as channel,  'Organic Shopping'as source  UNION ALL
      select 'no.shopping.net' as channel,  'Organic Shopping'as source  UNION ALL
      select 'se.shopping.net' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shopzilla' as channel,  'Organic Shopping'as source  UNION ALL
      select 'walmart' as channel,  'Organic Shopping'as source  UNION ALL
      select 'checkout.shopify.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'ebay.com.au' as channel,  'Organic Shopping'as source  UNION ALL
      select 'mercadolibre.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'offer.alibaba.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shop.app' as channel,  'Organic Shopping'as source  UNION ALL
      select 'shopzilla.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'walmart.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'checkout.stripe.com' as channel,  'Organic Shopping'as source  UNION ALL
      select 'ebay.de' as channel,  'Organic Shopping'as source  UNION ALL
      select 'mercadolibre.com.ar' as channel,  'Organic Shopping'as source ;;
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
