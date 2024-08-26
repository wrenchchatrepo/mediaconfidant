view: paid_shopping
{
  derived_table: {
    datagroup_trigger:attribution_channel
    sql: select 'Google Shopping' as channel, 'Paid Channel' as source UNION ALL
      select 'IGShopping' as channel, 'Paid Channel' as source UNION ALL
      select 'aax-us-east.amazon-adsystem.com' as channel, 'Paid Channel' as source UNION ALL
      select 'aax.amazon-adsystem.com' as channel, 'Paid Channel' as source UNION ALL
      select 'alibaba' as channel, 'Paid Channel' as source UNION ALL
      select 'alibaba.com' as channel, 'Paid Channel' as source UNION ALL
      select 'amazon' as channel, 'Paid Channel' as source UNION ALL
      select 'amazon.co.uk' as channel, 'Paid Channel' as source UNION ALL
      select 'amazon.com' as channel, 'Paid Channel' as source UNION ALL
      select 'apps.shopify.com' as channel, 'Paid Channel' as source UNION ALL
      select 'checkout.shopify.com' as channel, 'Paid Channel' as source UNION ALL
      select 'checkout.stripe.com' as channel, 'Paid Channel' as source UNION ALL
      select 'cr.shopping.naver.com' as channel, 'Paid Channel' as source UNION ALL
      select 'cr2.shopping.naver.com' as channel, 'Paid Channel' as source UNION ALL
      select 'ebay' as channel, 'Paid Channel' as source UNION ALL
      select 'ebay.co.uk' as channel, 'Paid Channel' as source UNION ALL
      select 'ebay.com' as channel, 'Paid Channel' as source UNION ALL
      select 'ebay.com.au' as channel, 'Paid Channel' as source UNION ALL
      select 'ebay.de' as channel, 'Paid Channel' as source UNION ALL
      select 'etsy' as channel, 'Paid Channel' as source UNION ALL
      select 'etsy.com' as channel, 'Paid Channel' as source UNION ALL
      select 'm.alibaba.com' as channel, 'Paid Channel' as source UNION ALL
      select 'm.shopping.naver.com' as channel, 'Paid Channel' as source UNION ALL
      select 'mercadolibre' as channel, 'Paid Channel' as source UNION ALL
      select 'mercadolibre.com' as channel, 'Paid Channel' as source UNION ALL
      select 'mercadolibre.com.ar' as channel, 'Paid Channel' as source UNION ALL
      select 'mercadolibre.com.mx' as channel, 'Paid Channel' as source UNION ALL
      select 'one.walmart.com' as channel, 'Paid Channel' as source UNION ALL
      select 'order.shopping.yahoo.co.jp' as channel, 'Paid Channel' as source UNION ALL
      select 'partners.shopify.com' as channel, 'Paid Channel' as source UNION ALL
      select 's3.amazonaws.com' as channel, 'Paid Channel' as source UNION ALL
      select 'se.shopping.net' as channel, 'Paid Channel' as source UNION ALL
      select 'shop.app' as channel, 'Paid Channel' as source UNION ALL
      select 'shopify' as channel, 'Paid Channel' as source UNION ALL
      select 'shopify.com' as channel, 'Paid Channel' as source UNION ALL
      select 'shopping.naver.com' as channel, 'Paid Channel' as source UNION ALL
      select 'shopping.yahoo.co.jp' as channel, 'Paid Channel' as source UNION ALL
      select 'shopping.yahoo.com' as channel, 'Paid Channel' as source UNION ALL
      select 'shopzilla' as channel, 'Paid Channel' as source UNION ALL
      select 'shopzilla.com' as channel, 'Paid Channel' as source UNION ALL
      select 'simplycodes.com' as channel, 'Paid Channel' as source UNION ALL
      select 'store.shopping.yahoo.co.jp' as channel, 'Paid Channel' as source UNION ALL
      select 'stripe' as channel, 'Paid Channel' as source UNION ALL
      select 'stripe.com' as channel, 'Paid Channel' as source UNION ALL
      select 'uk.shopping.net' as channel, 'Paid Channel' as source UNION ALL
      select 'walmart' as channel, 'Paid Channel' as source UNION ALL
      select 'walmart.com' as channel, 'Paid Channel' as source ;;
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
