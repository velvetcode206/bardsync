export type WeekDay = typeof WEEK_DAYS[keyof typeof WEEK_DAYS]

export type Art = typeof ARTS[keyof typeof ARTS]

export type Locales = typeof LOCALES[keyof typeof LOCALES]

export interface ILink {
  to: string
  name: string
}

export interface IMedia {
  type: 'image' | 'video' | 'youtube'
  src: string
  span?: 'lg:col-span-2' | 'lg:row-span-2' | 'lg:col-span-2 lg:row-span-2'
  alt?: string
  muted?: boolean
}

export interface IImageData {
  src: string
  alt: string
  text?: string
}

export interface ISocials {
  facebook?: string
  instagram?: string
  tiktok?: string
}

export interface IContacts {
  phones?: string[]
  emails?: string[]
  socials?: ISocials
}

export interface ISensei {
  id: string
  name: string
  contacts: IContacts
  isSouke?: boolean
  isShihan?: boolean
  introduction?: Record<Locales, string>
}

export interface IDojo {
  id: string
  name: string
  main: boolean
  address: string
  mapSrc: string
  mapSrcStreet: string
  details: Record<Locales, string>
  senseiIds: string[]
  _senseis: ISensei[]
}

export interface IClassSchedule {
  weekDay: WeekDay
  inPerson: boolean
  timeStart: {
    hour: number
    minute: number
  }
  timeEnd: {
    hour: number
    minute: number
  }
}

export interface IClass {
  id: string
  dojo: IDojo
  sensei: ISensei
  art: Art
  enrollmentFee: number
  monthlyFee: number
  schedules: IClassSchedule[]
  experimental: boolean
  details?: Record<Locales, string>
}
